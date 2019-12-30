view: deals_history {
  sql_table_name: deals_labelled_history ;;
  view_label: "Sales"

  dimension: deal_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.deal_id ;;
  }

  dimension: days_difference {
    type: number
    group_label: "Deals History"
    label: "Days to Current Funnel Stage"
    hidden: no
    sql: ${TABLE}.days_diff ;;
  }


  measure: avg_days_difference {
    type: average
    group_label: "Deals History"
    label: "Average Days to Next Funnel Stage"
    hidden: no
    sql: ${TABLE}.days_diff ;;
  }

  dimension: sales_opportunity_stage {
    label: "Current Funnel Stage"
    group_label: "Deals History"
    group_item_label: "Current Funnel Stage"

    type: string
    sql: ${TABLE}.stage_label ;;
    order_by_field: sales_opportunity_stage_sort_index
  }



  dimension: sales_opportunity_stage_sort_index {
    type: number
    hidden: yes
    label: "   Deal Stage Order"
    group_label: "  Deals"
    group_item_label: "Stage Order"
    sql: ${TABLE}.stage_displayorder ;;
  }



}
