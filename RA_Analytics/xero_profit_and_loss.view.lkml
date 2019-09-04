view: xero_profit_and_loss {
  sql_table_name: ra_data_warehouse_dbt_prod.xero_profit_and_loss ;;
  view_label: "Profit and Loss Report"

  dimension: account {
    group_label: "14 Company Finances"
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: account_code {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.account_code ;;
  }

  dimension: account_type {
    group_label: "14 Company Finances"
    order_by_field: account_type_sortorder

    type: string
    sql: case when ${TABLE}.account_type in ('REVENUE','OTHERINCOME') then 'Sales'
              when ${TABLE}.account_type in ('OVERHEADS','EXPENSE') then 'Operating Expenses'
              when ${TABLE}.account_type = 'DIRECTCOSTS' then 'Cost of Goods Sold' end ;;
  }

  dimension: account_type_sortorder {
    hidden: yes
    type: number
    sql: case when ${account_type} = 'Sales' then 1
              when ${account_type} = 'Cost of Goods Sold' then 2
              when ${account_type} = 'Operating Expenses' then 3 end;;
  }

  dimension: actual_or_budget {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.actual_or_budget ;;
  }

  dimension: amount {
    group_label: "14 Company Finances"

    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_amount {
    group_label: "14 Company Finances"

    type: sum
    value_format_name: gbp_0
    sql: ${TABLE}.amount ;;
  }

  dimension: pk {
    sql: concat(cast(${period_ts_month} as string),account) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: description {
    group_label: "14 Company Finances"

    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: period_ts {
    group_label: "14 Company Finances"
    label: "Period"
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}.period_ts ;;
  }


}
