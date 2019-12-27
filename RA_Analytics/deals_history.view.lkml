view: deals_history {
  sql_table_name: deals_labelled_history ;;
  view_label: "Hubspot  Historic Deal Tracking"

  dimension: deal_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.deal_id ;;
  }

  dimension: days_difference {
    type: number
    group_label: "  Velocity"
    label: "Difference between days"
    hidden: no
    sql: ${TABLE}.days_diff ;;
  }

  dimension: deal_name {
    type: string
    group_label: "  Deals"
    label: "Deal name"
    hidden: no
    sql: ${TABLE}.dealname ;;
  }

  measure: avg_days_difference {
    type: average
    group_label: "  Velocity"
    label: "Average Difference between days"
    hidden: no
    sql: ${TABLE}.days_diff ;;
  }

  dimension: sales_opportunity_stage {
    label: "   Deal Stage"
    group_label: "  Deals"
    group_item_label: "Stage"

    type: string
    sql: ${TABLE}.stage_label ;;
  }
  dimension_group: dealstage {

    type: time
    group_label: "  Deals"
    timeframes: [raw,date,month]
    sql: ${TABLE}.dealstage_ts ;;
  }

  dimension: sales_opportunity_stage_sort_index {
    type: number
    label: "   Deal Stage Order"
    group_label: "  Deals"
    group_item_label: "Stage Order"
    sql: ${TABLE}.stage_displayorder ;;
  }

  dimension: sales_opportunity_stage_pipeline_modifier {
    group_label: "  Deals"
    hidden: no
    type: number
    sql: ${TABLE}.probability ;;

  }

}
