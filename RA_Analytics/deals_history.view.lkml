view: deals {
  sql_table_name: deals ;;
  view_label: "Sales"


  dimension: pk{
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.dbt_scd_id;;
  }

  filter: is_latest_deal_stage {
    type: yesno
    hidden: yes
    sql: ${TABLE}.dbt_valid_to is null ;;
    group_label: "Deal Details"

    default_value: "Yes"
  }

  dimension: days_difference {
    type: number
    group_label: "Deal Details"
    label: "Difference between days"
    hidden: yes
    sql: ${TABLE}.days_between_stage ;;
  }

  dimension: assigned_consultant {
    type: string
    group_label: "Deal Details"
    label: "Assigned Consultant"
    hidden: no
    sql: ${TABLE}.assigned_consultant ;;
  }


  measure: avg_days_difference {
    type: average
    group_label: "Deal Velocity"
    label: "Average Days to Next Stage"
    hidden: no
    value_format_name: decimal_1
    sql: ${days_difference} ;;
  }


  dimension: deal_id {
    primary_key: no
    type: number
    hidden: yes
    sql: ${TABLE}.deal_id ;;
  }



  dimension: amount {
    group_label: "Deal Details"
    type: number
    value_format_name: gbp_0
    hidden: yes
    sql: ${TABLE}.current_amount ;;
  }

  dimension: historic_amount {
    group_label: "Deal History"
    type: number
    value_format_name: gbp_0
    hidden: yes
    sql: ${TABLE}.amount ;;
  }

  dimension: has_hubspot_owner {
    group_label: "Deal Details"
    type: yesno
    sql: ${TABLE}.current_hubspot_owner_id is not null ;;
  }

  dimension: historic_has_hubspot_owner {
    group_label: "Deal History"
    type: yesno
    sql: ${TABLE}.hubspot_owner_id is not null ;;
  }

  dimension: amount_tier {
    group_label: "Deal Details"
    type: tier
    tiers: [50000,150000,500000]
    style: integer
    value_format_name: gbp_0
    sql: ${amount} ;;
  }

  dimension: historic_amount_tier {
    group_label: "Deal History"
    type: tier
    tiers: [50000,150000,500000]
    style: integer
    value_format_name: gbp_0
    sql: ${amount} ;;
  }

  dimension: closed_won {
    group_label: "Deal Details"
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
    group_label: "Deal Details"
    label: "Weighting %"
    hidden: no
    type: number
    value_format_name: percent_0
    sql: ${TABLE}.current_probability ;;
  }

  dimension: historic_probability {
    group_label: "Deal History"
    label: "Historical Weighting %"
    hidden: no
    type: number
    value_format_name: percent_0
    sql: ${TABLE}.probability ;;
  }

  dimension: pipeline_weighted_amount {
    group_label: "Deal Details"
    hidden: no
    type: number
    value_format_name: gbp
    sql: cast(${TABLE}.current_amount * (${TABLE}.current_probability/1) as int64);;
  }

  dimension: historic_pipeline_weighted_amount {
    group_label: "Deal History"
    label: "Historical Pipeline Weighted Amount"
    hidden: no
    type: number
    sql: ${TABLE}.amount * (${probability}/1);;
  }

  dimension: hubspot_owner_email {
    group_label: "Deal Details"
    type: string
    sql: ${TABLE}.current_hubspot_owner_email ;;
  }

  dimension: historic_hubspot_owner_email {
    group_label: "Deal History"
    label: "Historical Hubspot Owner Email"
    type: string
    sql: ${TABLE}.hubspot_owner_email ;;
  }

  dimension: closed_lost_reason {
    group_label: "Deal Details"
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension: pipeline {
    label: "Pipeline Name"
    group_label: "Deal Details"
    type: string
    sql: ${TABLE}.pipeline_label ;;
  }

  dimension_group: historic_opportunity_closed {
    group_label: "Deal History"
    label: "Historical Deal Close"
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: opportunity_closed {
    group_label: "Deal Details"
    label: "Deal Close"
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    sql: ${TABLE}.current_closedate ;;
  }

  dimension_group: opportunity_created {
    group_label: "Deal Details"
    label: "Deal Created"
    type: time
    timeframes: [
      date,month
    ]
    sql: ${TABLE}.createdate ;;
  }

  dimension: opportunity_name {
    label: "Deal Name"
    group_label: "Deal Details"
    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: historic_opportunity_name {
    label: "Historical Deal Name"
    group_label: "Deal History"
    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: sales_opportunity_stage_sort_index {
    type: number
    hidden: yes

    label: "Deal Stage Order"
    group_label: "Deal Details"
    sql: ${TABLE}.current_stage_displayorder ;;
  }

  dimension: previous_sales_opportunity_stage_sort_index {
    type: number
    hidden: yes
    label: "Previous Deal Stage Order"
    group_label: "Deal Details"
    sql: ${TABLE}.previous_stage_displayorder ;;
  }

  dimension: historic_sales_opportunity_stage_sort_index {
    type: number
    hidden: yes

    label: "Historic Deal Stage Order"
    group_label: "Deal History"
    sql: ${TABLE}.stage_displayorder ;;
  }

  dimension: dealstage_id {
    type: string
    hidden: yes
    sql: ${TABLE}.current_dealstage_id ;;
  }

  dimension: historic_dealstage_id {
    type: string
    hidden: yes
    sql: ${TABLE}.dealstage_id ;;
  }

  dimension: sales_opportunity_stage {
    label: "Deal Stage"
    group_label: "Deal Details"

    type: string
    sql: ${TABLE}.current_stage_label ;;
    order_by_field: sales_opportunity_stage_sort_index
  }

  dimension: previous_sales_opportunity_stage {
    label: "Previous Deal Stage"
    group_label: "Deal Details"

    type: string
    sql: ${TABLE}.previous_stage_label ;;
    order_by_field: previous_sales_opportunity_stage_sort_index
  }

  dimension: historic_sales_opportunity_stage {
    label: "Historic Deal Stage"
    group_label: "Deal History"
    type: string
    sql: ${TABLE}.stage_label ;;
    order_by_field: historic_sales_opportunity_stage_sort_index
  }

  dimension: hubspot_owner_id {
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }

  dimension: current_hubspot_owner_id {
    hidden: yes

    type: string
    sql: ${TABLE}.current_hubspot_owner_id ;;
  }


  dimension_group: last_contacted {
    label: "Last Contact"
    group_label: "Deal Details"
    hidden: yes

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
    group_label: "Deal Details"
    hidden: yes

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  dimension_group: start {
    group_label: "Deal Details"

    type: time

    timeframes: [
      date,
      month
    ]
    sql: ${TABLE}.current_start_date_ts ;;
  }

  dimension_group: end {
    group_label: "Deal Details"

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.current_end_date_ts ;;
  }

  dimension_group: historic_start {
    group_label: "Deal History"

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.current_start_date_ts ;;
  }

  dimension_group: historic_end {
    group_label: "Deal History"

    type: time

    timeframes: [
      date
    ]
    sql: ${TABLE}.current_end_date_ts ;;
  }

  dimension_group: dealstage {

    type: time
    group_label: "Deal Details"
    timeframes: [raw,date,month]
    sql: ${TABLE}.current_dealstage_ts ;;
  }

  dimension_group: historic_dealstage {

    type: time
    label: "Historic Dealstage"
    group_label: "Deal History"
    timeframes: [raw,date,month]
    sql: ${TABLE}.dealstage_ts ;;
  }

  dimension_group: previous_dealstage {

    type: time
    label: "Previous Dealstage"
    group_label: "Deal Details"
    timeframes: [time]
    sql: ${TABLE}.previous_dealstage_ts ;;
  }


  dimension: source {
    group_label: "Deal Details"
    label: "Deal Source"
    type: string
    hidden: yes
    sql: ${TABLE}.source ;;
  }



  dimension: products_in_solution {
    group_label: "Deal Details"
    label: "Deal Products in Solution"
    type: string
    hidden: no
    sql: ${TABLE}.products_in_solution ;;
  }

  dimension: pricing_model {
    group_label: "Deal Details"
    label: "Deal Pricing Model"
    type: string
    hidden: no
    sql: ${TABLE}.pricing_model ;;
  }

  dimension: duration_days {
    group_label: "Deal Details"
    label: "Deal Duration in Days"
    type: number
    hidden: no
    sql: ${TABLE}.duration_days ;;
  }

  dimension: sprint_type {
    group_label: "Deal Details"
    label: "Deal Sprint Type"
    type: string
    hidden: yes
    sql: ${TABLE}.sprint_type ;;
  }

  dimension: salesperson {
    group_label: "Deal Details"

    label: "Salesperson Name"
    type: string
    sql: ${TABLE}.current_salesperson_full_name ;;
  }

  dimension: historic_salesperson {
    group_label: "Deal History"

    label: "Historic Salesperson Name"
    type: string
    sql: ${TABLE}.salesperson_full_name ;;
  }

  dimension: previous_salesperson {
    group_label: "Deal Details"

    label: "Previous Salesperson Name"
    type: string
    sql: ${TABLE}.previous_salesperson_full_name ;;
  }

  dimension: historic_salesperson_email {
    group_label: "Deal History"

    label: "Historic Salesperson Email"
    type: string
    sql: ${TABLE}.salesperson_email ;;
  }

  dimension: salesperson_email {
    group_label: "Deal Details"

    label: "  Salesperson Email"
    type: string
    sql: ${TABLE}.current_salesperson_email ;;
  }

  dimension: historic_days_to_close {
    group_label: "Deal History"

    hidden: yes
    type: number
    sql: case when ${historic_sales_opportunity_stage_sort_index} = 5 then date_diff(date(${TABLE}.closedate),date(${TABLE}.createdate),DAY) end;;
  }

  dimension: days_to_close {
    group_label: "Deal Details"

    hidden: yes
    type: number
    sql: case when ${sales_opportunity_stage_sort_index} = 5 then date_diff(date(${TABLE}.current_closedate),date(${TABLE}.current_createdate),DAY) end;;
  }

  dimension: services_stage_group {
    type: string
    label: "Delivery Pipeline Stage Group"
    description: "For services only, pipeline stages grouped to deliverable, upcoming and pipeline"
    group_label: "Deal Details"
    hidden: no
    order_by_field: services_stage_group_sort_index
    sql: CASE
      WHEN ${sales_opportunity_stage} in ('Closed Won and Scheduled','Verbally Won and Working at Risk') then 'Active Projects'
      WHEN ${sales_opportunity_stage} in ('Closed Lost') then 'Lost'
      when ${sales_opportunity_stage} in ('Closed Won and Delivered') then 'Delivered'
      when ${sales_opportunity_stage} in ('Deal Agreed and Awaiting Sign-off','Proposal Sent') then 'About to Close'
      else 'Pipeline' end ;;
  }

  dimension: services_stage_group_sort_index {
    type: string
    label: "Delivery Pipeline Stage Group"
    description: "For services only, pipeline stages grouped to deliverable, upcoming and pipeline"
    group_label: "Deal Details"
    hidden: no
    sql: CASE
      WHEN ${sales_opportunity_stage} in ('Closed Won and Scheduled','Verbally Won and Working at Risk') then 4
      WHEN ${sales_opportunity_stage} in ('Closed Lost') then -2
      when ${sales_opportunity_stage} in ('Closed Won and Delivered') then -1
      when ${sales_opportunity_stage} in ('Deal Agreed and Awaiting Sign-off','Proposal Sent') then 3
      else 2 end ;;
  }

  dimension: historic_services_stage_group {
    type: string
    description: "For services only, pipeline stages grouped to open, won and lost"
    group_label: "Deal History"
    hidden: no
    sql: CASE
      WHEN ${sales_opportunity_stage} in ('Closed Won and Scheduled','Verbally Won and Working at Risk') then 'Active Projects'
      WHEN ${sales_opportunity_stage} in ('Closed Lost') then 'Lost'
      when ${sales_opportunity_stage} in ('Closed Won and Delivered') then 'Delivered'
      when ${sales_opportunity_stage} in ('Deal Agreed and Awaiting Sign-off','Proposal Sent') then 'About to Close'
      else 'Pipeline' end ;;
  }




  dimension: difference_total_weighted{
    group_label: "Deal Details"
    type: number
    sql: ${amount} - ${pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }

  dimension: historic_difference_total_weighted{
    group_label: "Deal History"
    type: number
    sql: ${historic_amount} - ${historic_pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }



  filter: open_opportunity {

    label: "Open Deal"
    hidden: yes
    type: yesno
    sql: case when ${sales_opportunity_stage_sort_index} >= 9 then false else true end;;
  }

  filter: historic_open_opportunity {
    label: "Historic Open Deal"
    hidden: yes
    type: yesno
    sql: case when ${historic_sales_opportunity_stage_sort_index} >= 9 then false else true end;;
  }

  dimension: active_deal {
    group_label: "Deal Details"

    label: "Active Deal"
    hidden: no
    type: yesno
    sql: ${TABLE}.current_is_active;;
  }

  dimension: historic_active_deal {
    label: "Active Deal"
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_active;;
  }

  dimension_group: historic_record_valid_from {
    type: time
    group_label: "Deal History"
    timeframes: [time]
    sql: ${TABLE}.dbt_valid_from ;;

  }

  dimension_group: historic_record_valid_to {
    type: time
    group_label: "Deal History"
    timeframes: [time]
    sql: ${TABLE}.dbt_valid_to ;;

  }




  filter: closed_won_opportunity {
    label: "Closed Won Deal"
    group_label: "Deal Details"

    type: yesno
    hidden: no

    sql: case when ${sales_opportunity_stage_sort_index} = 9 then false else true end;;
  }

  filter: historic_closed_won_opportunity {
    group_label: "Deal History"

    label: "Closed Won Deal"
    type: yesno
    hidden: yes

    sql: case when ${historic_sales_opportunity_stage_sort_index} = 9 then false else true end;;
  }


  filter: closed_lost_opportunity {
    label: "Closed Lost Deal"
    type: yesno
    hidden: yes

    sql: case when ${sales_opportunity_stage_sort_index} = 10 then false else true end;;
  }

  filter: historic_closed_lost_opportunity {
    label: "Closed Lost Deal"
    type: yesno
    hidden: yes

    sql: case when ${historic_sales_opportunity_stage_sort_index} = 10 then false else true end;;
  }


  measure: services_all_deals_count {
    group_label: "     Deal Counts"
    type: count_distinct
    description: "Count of all deals"
    sql: ${deal_id} ;;
  }

  measure: services_active_deals_count {
    group_label: "     Deal Counts"
    type: count_distinct
    description: "Count of active deals"
    sql: ${deal_id} ;;
    filters: {field: active_deal
      value: "Yes"}
  }

  measure: historic_services_active_deals_count {
    group_label: "     Deal Counts"
    type: count_distinct
    description: "Historic Count of active deals"
    sql: ${deal_id} ;;
    filters: {field: historic_active_deal
      value: "Yes"}
  }

  measure: services_active_customers_count {
    group_label: "     Deal Counts"
    type: count_distinct
    description: "Count of active customers"
    sql: ${customer_master.customer_id} ;;
    filters: {field: active_deal
      value: "Yes"}
  }



  measure: services_open_deals_count {
    group_label: "     Deal Counts"
    type: count_distinct
    sql: ${deal_id} ;;

    description: "Count of open deals"
    filters: {
      field: services_stage_group
      value: "Open"
    }
  }

  measure: services_won_deals_count {
    group_label: "     Deal Counts"
    type: count_distinct
    sql: ${deal_id} ;;

    description: "Count of won deals"
    filters: {
      field: services_stage_group
      value: "Won"
    }
  }

  measure: services_lost_deals_count {
    group_label: "     Deal Counts"
    type: count_distinct
    sql: ${deal_id} ;;

    description: "Count of lost deals"
    filters: {
      field: services_stage_group
      value: "Lost"
    }
  }

  measure: services_all_deals_total_amount {
    group_label: "    Total Deal Amounts"
    type: sum_distinct
    description: "Sum of total amount for all deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;
    value_format_name: gbp_0
  }

  measure: services_open_deals_total_amount {
    group_label: "    Total Deal Amounts"
    type: sum_distinct
    description: "Sum of total amount for open deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;

    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: services_won_deals_total_amount {
    group_label: "    Total Deal Amounts"
    type: sum_distinct
    description: "Sum of total amount for won deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;
    filters: {
      field: services_stage_group
      value: "Won"
    }
    value_format_name: gbp_0
  }

  measure: services_lost_deals_total_amount {
    group_label: "    Total Deal Amounts"
    type: sum_distinct
    description: "Sum of total amount for lost deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;
    filters: {
      field: services_stage_group
      value: "Lost"
    }
    value_format_name: gbp_0
  }

  measure: services_all_deals_weighted_amount {
    group_label: "  Weighted Deal Amounts"
    type: sum_distinct
    description: "Sum of weighted amount for all deals"
    sql: ${pipeline_weighted_amount} ;;
    sql_distinct_key: ${deal_id} ;;

    value_format_name: gbp_0
  }

  measure: services_open_deals_weighted_amount {
    group_label: "  Weighted Deal Amounts"
    type: sum_distinct
    description: "Sum of weighted amount for open deals"
    sql: ${pipeline_weighted_amount} ;;
    sql_distinct_key: ${deal_id} ;;

    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: services_difference_total_weighted {
    group_label: "    Total Deal Amounts"
    type: sum_distinct
    description: "Sum of difference between total deal amount and weighted deal amount"
    sql: ${difference_total_weighted} ;;
    sql_distinct_key: ${deal_id} ;;

    value_format_name: gbp_0
  }

  measure: services_all_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average_distinct
    description: "Average of total amount for all deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;

    value_format_name: gbp_0
  }

  measure: services_open_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average_distinct
    description: "Average of total amount for open deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;

    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: services_won_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average_distinct
    description: "Average of total amount for won deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;

    filters: {
      field: services_stage_group
      value: "Won"
    }
    value_format_name: gbp_0
  }

  measure: services_lost_deals_average_amount {
    group_label: "Average Deal Amounts"
    type: average_distinct
    description: "Average of total amount for lost deals"
    sql: ${amount} ;;
    sql_distinct_key: ${deal_id} ;;

    filters: {
      field: services_stage_group
      value: "Lost"
    }
    value_format_name: gbp_0
  }

  measure: services_all_deals_average_weighted_amount {
    group_label: "Average Deal Amounts"
    type: average_distinct
    description: "Average of weighted amount for all deals"
    sql: ${pipeline_weighted_amount} ;;
    sql_distinct_key: ${deal_id} ;;

    value_format_name: gbp_0
  }

  measure: services_open_deals_average_weighted_amount {
    group_label: "Average Deal Amounts"
    type: average_distinct
    description: "Average of weighted amount for open deals"
    sql: ${pipeline_weighted_amount} ;;
    sql_distinct_key: ${deal_id} ;;

    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: average_days_to_close {
    group_label: "Deal Velocity"

    type: average_distinct
    sql: ${TABLE}.days_to_close ;;
    sql_distinct_key: ${deal_id} ;;
    value_format: "0"
  }

  measure: historic_services_active_customers_count {
    group_label: "Historic Deal Counts"
    type: count_distinct
    description: "Count of active customers"
    sql: ${customer_master.customer_id} ;;
    filters: {field: historic_active_deal
      value: "Yes"}
  }



  measure: historic_services_open_deals_count {
    group_label: "Historic Deal Counts"
    type: count_distinct
    sql: ${deal_id} ;;
    description: "Count of open deals"
    filters: {
      field: historic_services_stage_group
      value: "Open"
    }
  }

  measure: historic_services_won_deals_count {
    group_label: "Historic Deal Counts"
    type: count_distinct
    sql: ${deal_id} ;;
    description: "Count of won deals"
    filters: {
      field: historic_services_stage_group
      value: "Won"
    }
  }

  measure: historic_services_lost_deals_count {
    group_label: "Historic Deal Counts"
    type: count_distinct
    sql: ${deal_id} ;;
    description: "Count of lost deals"
    filters: {
      field: historic_services_stage_group
      value: "Lost"
    }
  }

  measure: historic_services_all_deals_total_amount {
    group_label: "Historic Deal Counts"
    type: sum
    description: "Sum of total amount for all deals"
    sql: ${historic_amount} ;;
    value_format_name: gbp_0
  }

  measure: historic_services_open_deals_total_amount {
    group_label: "Historic Deal Counts"
    type: sum
    description: "Sum of total amount for open deals"
    sql: ${historic_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_won_deals_total_amount {
    group_label: "Historic Deal Counts"
    type: sum
    description: "Sum of total amount for won deals"
    sql: ${historic_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Won"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_lost_deals_total_amount {
    group_label: "Historic Deal Counts"
    type: sum
    description: "Sum of total amount for lost deals"
    sql: ${historic_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Lost"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_all_deals_weighted_amount {
    group_label: "Historic Weighted Deal Counts"
    type: sum
    description: "Sum of weighted amount for all deals"
    sql: ${historic_pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }

  measure: historic_services_open_deals_weighted_amount {
    group_label: "Historic Weighted Deal Counts"
    type: sum
    description: "Sum of weighted amount for open deals"
    sql: ${historic_pipeline_weighted_amount} ;;
    filters: {
      field: services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_difference_total_weighted {
    group_label: "Historic Weighted Deal Counts"
    type: sum
    description: "Sum of difference between total deal amount and weighted deal amount"
    sql: ${historic_difference_total_weighted} ;;
    value_format_name: gbp_0
  }

  measure: historic_services_all_deals_average_amount {
    group_label: "Historic Average Deal Counts"
    type: average
    description: "Average of total amount for all deals"
    sql: ${historic_amount} ;;
    value_format_name: gbp_0
  }

  measure: historic_services_open_deals_average_amount {
    group_label: "Historic Average Deal Counts"
    type: average
    description: "Average of total amount for open deals"
    sql: ${historic_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_won_deals_average_amount {
    group_label: "Historic Average Deal Counts"
    type: average
    description: "Average of total amount for won deals"
    sql: ${historic_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Won"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_lost_deals_average_amount {
    group_label: "Historic Average Deal Counts"
    type: average
    description: "Average of total amount for lost deals"
    sql: ${historic_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Lost"
    }
    value_format_name: gbp_0
  }

  measure: historic_services_all_deals_average_weighted_amount {
    group_label: "Historic Average Deal Counts"
    type: average
    description: "Average of weighted amount for all deals"
    sql: ${historic_pipeline_weighted_amount} ;;
    value_format_name: gbp_0
  }

  measure: historic_services_open_deals_average_weighted_amount {
    group_label: "Historic Average Deal Counts"
    type: average
    description: "Average of weighted amount for open deals"
    sql: ${historic_pipeline_weighted_amount} ;;
    filters: {
      field: historic_services_stage_group
      value: "Open"
    }
    value_format_name: gbp_0
  }

  dimension: partner_referral_type {
    group_label: "Deal Details"
    group_item_label: "Referral Type"
    label: "Partner Channel"
    type: string
    sql: coalesce(${TABLE}.partner_referral_type,'Direct') ;;
  }

  dimension: deal_components {
    hidden: yes

    type: string
    sql: ${TABLE}.deal_components ;;
  }

  dimension: deal_type {
    group_label: "Deal Details"
    group_item_label: "New or Existing Business"
    label: "New or Existing Business"
    type: string
    sql: ${TABLE}.deal_type ;;
  }

  measure: count_services_component {
    group_label: "Deal Component Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_services_deal_component ;;
  }

  measure: count_support_component {
    group_label: "Deal Component Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_support_deal_component ;;
  }

  measure: count_license_component {
    group_label: "Deal Component Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_license_referral_deal_component ;;
  }

  measure: count_managed_services_component {
    group_label: "Deal Component Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_managed_services_deal_component ;;
  }

  measure: count_data_analytics_sprint {
    group_label: "Deal Sprint Type Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_data_analytics_sprint_type ;;
  }

  measure: count_data_engineering_sprint {
    group_label: "Deal Sprint Type Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_data_engineering_sprint_type ;;
  }

  measure: count_data_science_sprint {
    group_label: "Deal Sprint Type Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_data_science_sprint_type ;;
  }

  measure: count_data_strategy_sprint_type {
    group_label: "Deal Sprint Type Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_data_strategy_sprint_type ;;
  }

  measure: count_data_integration_sprint_type {
    group_label: "Deal Sprint Type Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_data_integration_sprint_type ;;
  }

  measure: count_data_collection_sprint_type {
    group_label: "Deal Sprint Type Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_data_collection_sprint_type ;;
  }

  measure: count_looker_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_looker_product_in_solution ;;
  }

  measure: count_dbt_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_dbt_product_in_solution ;;
  }

  measure: count_stitch_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_stitch_product_in_solution ;;
  }

  measure: count_segment_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_segment_product_in_solution ;;
  }

  measure: count_gcp_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_gcp_product_in_solution ;;
  }

  measure: count_snowflake_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_snowflake_product_in_solution ;;
  }

  measure: count_fivetran_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_fivetran_product_in_solution ;;
  }

  measure: count_qubit_product_in_solution {
    group_label: "Deal Technology Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_qubit_product_in_solution ;;
  }

  measure: count_partner_referral_source {
    group_label: "Deal Source Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_partner_referral_source ;;
  }

  measure: count_ceo_network_source {
    group_label: "Deal Source Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_ceo_network_source ;;
  }

  measure: count_staff_referral_referral_source {
    group_label: "Deal Source Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_staff_referral_referral_source ;;
  }

  measure: count_organic_search_source {
    group_label: "Deal Source Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_organic_search_source ;;
  }

  measure: count_repeat_customer_source {
    group_label: "Deal Source Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_repeat_customer_source ;;
  }

  measure: count_paid_search_source {
    group_label: "Deal Source Counts"
    sql_distinct_key: ${deal_id} ;;

    type: sum_distinct
    sql: ${TABLE}.count_paid_search_source ;;
  }



}
