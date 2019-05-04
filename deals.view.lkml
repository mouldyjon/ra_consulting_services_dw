view: deals {
  sql_table_name: deals ;;
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

  dimension: pipeline_weighted_amount {
    type: number

    hidden: yes

    sql: ${TABLE}.amount * (${sales_opportunity_stage_pipeline_modifier}/100) ;;
  }

  measure: total_opportunity_amount {
    type: sum_distinct
    value_format_name: gbp_0

    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount ;;
  }

  measure: total_weighted_opportunity_amount {
    type: sum_distinct
    value_format_name: gbp_0

    sql_distinct_key: ${deal_id} ;;
    sql: ${pipeline_weighted_amount} ;;
  }

  measure: avg_opportunity_amount {
    type: average
    value_format_name: gbp_0

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
    hidden: yes

    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount_in_home_currency ;;
  }

  measure: avg_amount_in_home_currency {
    hidden: yes

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
    group_label: "Opportunity Status"
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension_group: opportunity_closed {
    group_label: "Opportunity Status"

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: opportunity_created {
    group_label: "Opportunity Details"

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.createdate ;;
  }

  dimension: opportunity_name {
    group_label: "Opportunity Details"

    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: sales_opportunity_stage_sort_index {
    type: number
    hidden: yes
    sql: ${TABLE}.dealstage_sortindex ;;
  }

  dimension: sales_opportunity_stage {
    group_label: "Opportunity Status"

    type: string
    sql: ${TABLE}.dealstage ;;
    order_by_field: sales_opportunity_stage_sort_index
  }

  dimension: sales_opportunity_stage_pipeline_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.dealstage_pipeline_modifier ;;

  }



  dimension: sales_opportunity_type {
    group_label: "Opportunity Details"

    type: string
    sql: ${TABLE}.dealtype ;;
  }





  dimension: hubspot_owner_id {
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }



  dimension_group: last_contacted {
    group_label: "Opportunity Details"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.notes_last_contacted ;;
  }

  dimension_group: notes_last_updated {
    group_label: "Opportunity Details"

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
    hidden: yes
    type: sum
    sql: ${TABLE}.num_notes ;;

  }

  dimension: sales_opportunity_pipeline {
    hidden: yes
    type: string
    sql: ${TABLE}.pipeline ;;
  }

  dimension_group: last_replied {
    type: time
    group_label: "Opportunity Details"

    timeframes: [
      date
    ]
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  measure: count_sales_opportunities {
    type: count_distinct
    sql: ${deal_id} ;;
  }
}
