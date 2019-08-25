view: revenue_vs_budget {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'invoices.project_invoice_issue_month'

      select month, sum(revenue_actual) as revenue_actual, sum(revenue_budget) as revenue_budget
      from (
      SELECT
        timestamp_trunc(invoices.issue_date, MONTH) AS month,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(invoices.amount ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(invoices.number  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(invoices.number  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(invoices.number  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(invoices.number  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS revenue_actual,
        0 as revenue_budget
      FROM `ra-development.ra_data_warehouse_dbt_prod.customer_master`  AS customer_master
      LEFT JOIN `ra-development.ra_data_warehouse_dbt_prod.harvest_invoices`  AS invoices ON customer_master.harvest_customer_id = invoices.client_id

      WHERE
        (invoices.issue_date  >= TIMESTAMP('2019-01-01 00:00:00'))
      GROUP BY 1
      union all
      SELECT
        timestamp_trunc(timestamp(month),MONTH) AS month,
        0 as revenue_actual,
        budget_amount as revenue_budget
      from `ra-development.ra_data_warehouse.budget`
      where account = 'Sales')
      group by 1
      order by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month ;;
  }

  dimension: revenue_actual {
    type: number
    sql: ${TABLE}.revenue_actual ;;
  }

  measure: total_revenue_actual {
    value_format_name: gbp
    type: sum

    sql: ${revenue_actual} ;;
  }

  measure: total_revenue_budget {
    value_format_name: gbp
    type: sum
    sql: ${revenue_budget} ;;
  }

  dimension: revenue_budget {
    type: number
    sql: ${TABLE}.revenue_budget ;;
  }

  set: detail {
    fields: [month_time, revenue_actual, revenue_budget]
  }
}