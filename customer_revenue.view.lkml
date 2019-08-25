view: customer_revenue {
  derived_table: {
    sql: SELECT
        customer_master.customer_id  AS customer_master_customer_id,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(case when deals.dealstage like '%Sales Closed Won%' then deals.amount end ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS deals_total_closed_opportunity_amount,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(case when time_entries.billable then time_entries.hours * time_entries.billable_rate end,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(time_entries.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(time_entries.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(time_entries.id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(time_entries.id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS time_entries_total_billable_revenue,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(CASE WHEN case when invoices.paid_date is not null then true else false end THEN invoices.amount - ifnull(cast(invoices.tax as float64),0) ELSE NULL END,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN case when invoices.paid_date is not null then true else false end THEN invoices.number  ELSE NULL END AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN case when invoices.paid_date is not null then true else false end THEN invoices.number  ELSE NULL END AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN case when invoices.paid_date is not null then true else false end THEN invoices.number  ELSE NULL END AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN case when invoices.paid_date is not null then true else false end THEN invoices.number  ELSE NULL END AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS invoices_total_paid_project_invoice_net_amount,
        (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(deals.amount ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)) - (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(CASE WHEN (deals.dealstage = 'Sales Closed Lost') THEN deals.amount  ELSE NULL END,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (deals.dealstage = 'Sales Closed Lost') THEN deals.deal_id  ELSE NULL END AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (deals.dealstage = 'Sales Closed Lost') THEN deals.deal_id  ELSE NULL END AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (deals.dealstage = 'Sales Closed Lost') THEN deals.deal_id  ELSE NULL END AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (deals.dealstage = 'Sales Closed Lost') THEN deals.deal_id  ELSE NULL END AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)) - (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(case when deals.dealstage like '%Sales Closed Won%' then deals.amount end ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(deals.deal_id  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0))  AS deals_total_open_opportunity_amount
      FROM ra_data_warehouse_dbt_prod.customer_master  AS customer_master
      LEFT JOIN ra_data_warehouse_dbt_prod.harvest_invoices  AS invoices ON customer_master.harvest_customer_id = invoices.client_id
      LEFT JOIN ra_data_warehouse_dbt_prod.customer_events  AS customer_events ON customer_master.customer_id = customer_events.customer_id
      LEFT JOIN rittman_analytics.projects  AS projects ON customer_master.harvest_customer_id = projects.client_id
      LEFT JOIN ra_data_warehouse_dbt_prod.harvest_time_entries  AS time_entries ON time_entries.project_id = projects.id
      LEFT JOIN ra_data_warehouse_dbt_prod.deals  AS deals ON customer_master.hubspot_company_id = deals.associatedcompanyids

      WHERE customer_events.billable_client AND projects.is_billable
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }



  dimension: customer_master_customer_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.customer_master_customer_id ;;
  }

  dimension: client_closed_business {
    type: number
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.deals_total_closed_opportunity_amount ;;
  }

  dimension: client_billable_revenue {
    type: number
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.time_entries_total_billable_revenue ;;
  }

  dimension: client_net_invoices_paid {
    type: number
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.invoices_total_paid_project_invoice_net_amount ;;
  }

  dimension: client_opportunities_open {
    type: number
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.deals_total_open_opportunity_amount ;;
  }

  measure: total_closed_business {
    type: sum
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.deals_total_closed_opportunity_amount ;;
  }

  measure: total_billable_revenue {
    type: sum
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.time_entries_total_billable_revenue ;;
  }

  measure: total_net_invoices_paid {
    type: sum
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.invoices_total_paid_project_invoice_net_amount ;;
  }

  measure: total_opportunities_open {
    type: sum
    group_label: "Company Revenue Metrics"

    sql: ${TABLE}.deals_total_open_opportunity_amount ;;
  }


}