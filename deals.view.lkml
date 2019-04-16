view: deals {
  sql_table_name: ra_data_warehouse.deals ;;
  view_label: "Sales Opportunities"

  dimension: deal_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.deal_id ;;
  }

  dimension: amount {
    type: number
    hidden: yes

    sql: ${TABLE}.amount ;;
  }

  measure: total_opportunity_amount {
    type: sum_distinct
    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount ;;
  }

  measure: avg_opportunity_amount {
    type: average
    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_in_home_currency {
    type: number
    hidden: yes
    sql: ${TABLE}.amount_in_home_currency ;;
  }

  measure: total_amount_in_home_currency {
    type: sum_distinct
    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount_in_home_currency ;;
  }

  measure: avg_amount_in_home_currency {
    type: average_distinct
    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount_in_home_currency ;;
  }

  dimension: hubspot_company_id {
    hidden: yes

    type: number
    sql: ${TABLE}.associatedcompanyids ;;
  }

  dimension: closed_lost_reason {
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension_group: sales_opportunity_closed {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: sales_opportunity_created {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.createdate ;;
  }

  dimension: sales_opportunity_name {
    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: sales_opportunity_stage {
    type: string
    sql: ${TABLE}.dealstage ;;
  }

  dimension: sales_opportunity_type {
    type: string
    sql: ${TABLE}.dealtype ;;
  }





  dimension: hubspot_owner_id {
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }



  dimension_group: sales_opportunity_notes_last_contacted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.notes_last_contacted ;;
  }

  dimension_group: sales_opportunity_notes_last_updated {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.notes_last_updated ;;
  }

  dimension: num_notes {
    type: number
    hidden: yes
    sql: ${TABLE}.num_notes ;;
  }

  measure: total_sales_opportunity_notes {
    type: sum
    sql: ${TABLE}.num_notes ;;

  }

  dimension: sales_opportunity_pipeline {
    type: string
    sql: ${TABLE}.pipeline ;;
  }

  dimension_group: sales_email_last_replied {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  measure: count_sales_opportunities {
    type: count_distinct
    sql_distinct_key: ${deal_id} ;;
  }
}
