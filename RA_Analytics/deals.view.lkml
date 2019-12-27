view: deals {
  sql_table_name: deals_labelled ;;
  view_label: "Hubspot Deal Tracking"

  dimension: deal_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.deal_id ;;
  }

  dimension: amount {
    group_label: "  Deals"
    type: number
    value_format_name: gbp_0
    hidden: no
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_tier {
    group_label: "  Deals"
    type: tier
    tiers: [50000,150000,500000]
    style: integer
    value_format_name: gbp_0
    sql: ${amount} ;;
  }

  dimension: closed_won {
    group_label: "  Deals"
    type: yesno
    hidden: no
    sql: ${TABLE}.closedwon ;;
  }

  dimension: deal_stage {
    type: yesno
    hidden: yes
    sql: ${TABLE}.dealstage ;;
  }

  dimension: probability {
    hidden: yes
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: pipeline_weighted_amount {
    group_label: "  Deals"
    hidden: no
    type: number
    sql: ${TABLE}.amount * (${probability}/1);;
  }

  dimension: hubspot_owner_email {
    hidden: yes
    type: string
    sql: ${TABLE}.hubspot_owner_email ;;
  }

  dimension: closed_lost_reason {
    group_label: "  Deals"
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension: pipeline {
    label: "       Pipeline Name"
    group_label: "  Deals"
    type: string
    sql: ${TABLE}.pipeline_label ;;
  }

  dimension_group: opportunity_closed {
    group_label: "  Deals"
    label: "Deal Close"
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: opportunity_created {
    group_label: "  Deals"
    label: "Deal Created"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.createdate ;;
  }

  dimension: opportunity_name {
    label: "     Deal Name"
    group_label: "  Deals"
    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: sales_opportunity_stage_sort_index {
    type: number
    label: "   Deal Stage Order"
    group_label: "  Deals"
    group_item_label: "Stage Order"
    sql: ${TABLE}.stage_displayorder ;;
  }

  dimension: dealstage_id {
    type: string
    hidden: yes
    sql: ${TABLE}.deadstage_id ;;
  }

  dimension: sales_opportunity_stage {
    label: "   Deal Stage"
    group_label: "  Deals"
    group_item_label: "Stage"

    type: string
    sql: ${TABLE}.stage_label ;;
    order_by_field: sales_opportunity_stage_sort_index

  }

  dimension: hubspot_owner_id {
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }



  dimension_group: last_contacted {
    label: "Last Contact"
    group_label: "  Deals"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.notes_last_contacted ;;
  }

  dimension_group: notes_last_updated {
    hidden: yes
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
    group_label: "  Deals"

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  dimension_group: start {
    group_label: "  Deals"

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.start_date_ts ;;
  }

  dimension_group: end {
    group_label: "  Deals"

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.end_date_ts ;;
  }

  dimension_group: dealstage {

    type: time
    group_label: "  Deals"
    timeframes: [raw,date,month]
    sql: ${TABLE}.dealstage_ts ;;
  }


  dimension: source {
    group_label: "  Deals"
    label: "   Deal Source"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: salesperson {
    group_label: "  Deals"

    label: "  Salesperson Name"
    type: string
    sql: ${TABLE}.salesperson_full_name ;;
  }

  dimension: salesperson_email {
    group_label: "  Deals"

    label: "  Salesperson Email"
    type: string
    sql: ${TABLE}.salesperson_email ;;
  }

  dimension: days_to_close {
    hidden: yes
    type: number
    sql: case when ${sales_opportunity_stage_sort_index} = 5 then date_diff(date(${TABLE}.closedate),date(${TABLE}.createdate),DAY) end;;
  }

  dimension: services_stage_group {
    type: string
    description: "For services only, pipeline stages grouped to open, won and lost"
    group_label: "  Deals"
    hidden: no
    sql: CASE
      WHEN ${sales_opportunity_stage_sort_index} = 0 THEN 'N/A'
      WHEN ${sales_opportunity_stage_sort_index} > 0 AND ${sales_opportunity_stage_sort_index} < 5 THEN 'Open'
      WHEN ${sales_opportunity_stage_sort_index} = 5 THEN 'Won'
      ELSE 'Lost'
      END ;;
  }

  dimension: difference_total_weighted{
    group_label: "  Deals"
    type: number
    sql: ${amount} - ${pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }

  #dimension: Open_Closed {
  # group_label: "  Deals"

  # label: "  Open/Closed"
  # type: string
  #  sql: case
  #       when (${sales_opportunity_stage_sort_index} < 5) then 'Open'
  #        when (${sales_opportunity_stage_sort_index} > 4) then 'Closed'
  #        end;;
  #}

  filter: open_opportunity {
    label: "Open Deal"
    hidden: yes
    type: yesno
    sql: case when ${sales_opportunity_stage_sort_index} >= 9 then false else true end;;
  }

  dimension: active_deal {
    label: "Active Deal"
    hidden: no
    type: yesno
    sql: ${TABLE}.is_active;;
  }

  filter: closed_won_opportunity {
    label: "Closed Won Deal"
    type: yesno
    hidden: yes

    sql: case when ${sales_opportunity_stage_sort_index} = 9 then false else true end;;
  }
  filter: closed_lost_opportunity {
    label: "Closed Lost Deal"
    type: yesno
    hidden: yes

    sql: case when ${sales_opportunity_stage_sort_index} = 10 then false else true end;;
  }

  measure: services_all_deals_count {
    group_label: "Deal Counts"
    type: count_distinct
    description: "Count of all deals, services only"
    sql: ${deal_id} ;;
  }

  measure: services_active_deals_count {
    group_label: "Deal Counts"
    type: count_distinct
    description: "Count of active deals, services only"
    sql: ${deal_id} ;;
    filters: {field: active_deal
      value: "Yes"}
  }

  measure: services_active_customers_count {
    group_label: "Deal Counts"
    type: count_distinct
    description: "Count of active customers, services only"
    sql: ${customer_master.customer_id} ;;
    filters: {field: active_deal
      value: "Yes"}
  }



  measure: services_open_deals_count {
    group_label: "Deal Counts"
    type: count
    description: "Count of open deals, services only"
    filters: {
      field: services_stage_group
      value: "Open"
    }
  }

  measure: services_won_deals_count {
    group_label: "Deal Counts"
    type: count
    description: "Count of won deals, services only"
    filters: {
      field: services_stage_group
      value: "Won"
    }
  }

  measure: services_lost_deals_count {
    group_label: "Deal Counts"
    type: count
    description: "Count of lost deals, services only"
    filters: {
      field: services_stage_group
      value: "Lost"
    }
  }

  measure: services_all_deals_total_amount {
    group_label: "Total Deal Amounts"
    type: sum
    description: "Sum of total amount for all deals, services only"
    sql: ${amount} ;;
    value_format_name: gbp_0
  }

  measure: services_open_deals_total_amount {
    group_label: "Total Deal Amounts"
    type: sum
    description: "Sum of total amount for open deals, services only"
    sql: ${amount} ;;
    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: services_won_deals_total_amount {
    group_label: "Total Deal Amounts"
    type: sum
    description: "Sum of total amount for won deals, services only"
    sql: ${amount} ;;
    filters: {
      field: services_stage_group
      value: "Won"
    }
    value_format_name: gbp_0
  }

  measure: services_lost_deals_total_amount {
    group_label: "Total Deal Amounts"
    type: sum
    description: "Sum of total amount for lost deals, services only"
    sql: ${amount} ;;
    filters: {
      field: services_stage_group
      value: "Lost"
    }
    value_format_name: gbp_0
  }

  measure: services_all_deals_weighted_amount {
    group_label: "Weighted Deal Amounts"
    type: sum
    description: "Sum of weighted amount for all deals, services only"
    sql: ${pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }

  measure: services_open_deals_weighted_amount {
    group_label: "Weighted Deal Amounts"
    type: sum
    description: "Sum of weighted amount for open deals, services only"
    sql: ${pipeline_weighted_amount} ;;
    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: services_difference_total_weighted {
    group_label: "Total Deal Amounts"
    type: sum
    description: "Sum of difference between total deal amount and weighted deal amount"
    sql: ${difference_total_weighted} ;;
    value_format_name: gbp_0
  }

  measure: services_all_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average
    description: "Average of total amount for all deals, services only"
    sql: ${amount} ;;
    value_format_name: gbp_0
  }

  measure: services_open_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average
    description: "Average of total amount for open deals, services only"
    sql: ${amount} ;;
    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: services_won_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average
    description: "Average of total amount for won deals, services only"
    sql: ${amount} ;;
    filters: {
      field: services_stage_group
      value: "Won"
    }
    value_format_name: gbp_0
  }

  measure: services_lost_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average
    description: "Average of total amount for lost deals, services only"
    sql: ${amount} ;;
    filters: {
      field: services_stage_group
      value: "Lost"
    }
    value_format_name: gbp_0
  }

  measure: services_all_deals_average_weighted_amount {
    group_label: "Average Deal Amounts"
    type: average
    description: "Average of weighted amount for all deals, services only"
    sql: ${pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }

  measure: services_open_deals_average_weighted_amount {
    group_label: "Average Deal Amounts"
    type: average
    description: "Average of weighted amount for open deals, services only"
    sql: ${pipeline_weighted_amount} ;;
    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: average_days_to_close {
    type: average
    sql: ${days_to_close} ;;
    value_format: "0"
  }


}
