view: deals {
  sql_table_name: deals_labelled ;;
  view_label: "Hubspot Deal Tracking"



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: sales_email_last_replied {
    hidden: yes
    type: time
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  dimension: closed_lost_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension: dealname {
    group_label: "Deals"
    group_item_label: "Name"
    label: "Deal Name"
    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: hubspot_owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }

  dimension: hubspot_owner_email {
    hidden: yes
    type: string
    sql: ${TABLE}.hubspot_owner_email ;;
  }

  dimension_group: lastmodifieddate {
    hidden: yes
    type: time
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension_group: notes_last_updated {
    hidden: yes
    type: time
    sql: ${TABLE}.notes_last_updated ;;
  }

  dimension: dealstage {
    hidden: yes
    type: string
    sql: ${TABLE}.dealstage ;;
  }

  dimension: dealstage_id {
    hidden: yes
    type: string
    sql: ${TABLE}.dealstage_id ;;
  }

  dimension_group: funnel_stage {
    group_label: "Deals"
    label: "Funnel Stage"
    type: time
    timeframes: [date, time,month]
    sql: ${TABLE}.dealstage_ts ;;
  }

  dimension: pipeline {
    hidden: yes
    type: string
    sql: ${TABLE}.pipeline ;;
  }

  dimension_group: close {
    group_label: "Deals"
    label: "Deal Close"
    type: time
    timeframes: [date,month]
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: create {
    timeframes: [date,month,quarter]
    group_label: "Deals"
    label: "Deal Created"
    type: time
    sql: ${TABLE}.createdate ;;
  }

  filter: is_open {
    label: "Open Deal"
    type: yesno
    sql: case when ${TABLE}.stage_label not in ('Closed Won and Delivered','Closed Lost') then true else false end;;
  }

  dimension: amount {
    hidden: yes

    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_deal_amount {
    group_label: "Deals"
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.amount ;;
  }

  measure: total_closed_deals_amount {
    group_label: "Deals"
    type: sum
    sql: ${TABLE}.amount ;;
    filters: {field: is_closed_won
              value: "Yes"}
  }

  measure: total_open_deals_amount {
    group_label: "Deals"
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: gbp

    filters: {field: is_open
      value: "Yes"}
  }

  measure: avg_deal_amount {
    group_label: "Deals"
    value_format_name: gbp

    type: average
    sql: ${TABLE}.amount ;;
  }


  dimension_group: notes_last_contacted {
    hidden: yes

    type: time
    sql: ${TABLE}.notes_last_contacted ;;
  }

  dimension: amount_in_home_currency {
    hidden: yes

    type: number
    sql: ${TABLE}.amount_in_home_currency ;;
  }

  dimension_group: hubspot_owner_assigneddate {
    hidden: yes

    type: time
    sql: ${TABLE}.hubspot_owner_assigneddate ;;
  }

  dimension: num_notes {
    hidden: yes

    type: number
    sql: ${TABLE}.num_notes ;;
  }

  dimension: description {
    group_label: "Deals"

    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: source {
    hidden: yes

    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: salesperson_email {
    hidden: yes

    type: string
    sql: ${TABLE}.salesperson_email ;;
  }

  filter: is_closed {
    label: "Deal Closed"
    default_value: "No"
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: pricing_model {
    group_label: "Deals"
    label: "Deal Pricing Model"
    group_item_label: "Pricing Model"
    type: string
    sql: ${TABLE}.pricing_model ;;
  }

  dimension: deal_source {
    group_label: "Deals"
    label: "Deal Source"
    group_item_label: "Source"
    type: string
    sql: ${TABLE}.deal_source ;;
  }

  dimension: products_in_solution {
    hidden: yes

    type: string
    sql: ${TABLE}.products_in_solution ;;
  }

  dimension: sprint_type {
    group_label: "Deals"
    group_item_label: "Sprint Type"
    label: "Deal Sprint Type"
    type: string
    sql: ${TABLE}.sprint_type ;;
  }

  dimension: days_to_close {
    hidden: yes
    type: number
    sql: ${TABLE}.days_to_close ;;
  }

  dimension: partner_referral_type {
    group_label: "Deals"
    group_item_label: "Referral Type"
    label: "Deal Referral Type"
    type: string
    sql: coalesce(${TABLE}.partner_referral_type,'Direct') ;;
  }

  dimension: deal_components {
    hidden: yes

    type: string
    sql: ${TABLE}.deal_components ;;
  }

  dimension: deal_type {
    group_label: "Deals"
    group_item_label: "New or Existing Business"
    label: "New or Existing Business"
    type: string
    sql: ${TABLE}.deal_type ;;
  }

  measure: count_services_component {
    group_label: "Deal Component Counts"

    type: sum
    sql: ${TABLE}.count_services_deal_component ;;
  }

  measure: count_support_component {
    group_label: "Deal Component Counts"

    type: sum
    sql: ${TABLE}.count_support_deal_component ;;
  }

  measure: count_license_component {
    group_label: "Deal Component Counts"

    type: sum
    sql: ${TABLE}.count_license_referral_deal_component ;;
  }

  measure: count_managed_services_component {
    group_label: "Deal Component Counts"

    type: sum
    sql: ${TABLE}.count_managed_services_deal_component ;;
  }

  measure: count_data_analytics_sprint {
    group_label: "Deal Sprint Type Counts"

    type: sum
    sql: ${TABLE}.count_data_analytics_sprint_type ;;
  }

  measure: count_data_engineering_sprint {
    group_label: "Deal Sprint Type Counts"

    type: sum
    sql: ${TABLE}.count_data_engineering_sprint_type ;;
  }

  measure: count_data_science_sprint {
    group_label: "Deal Sprint Type Counts"

    type: sum
    sql: ${TABLE}.count_data_science_sprint_type ;;
  }

  measure: count_data_strategy_sprint_type {
    group_label: "Deal Sprint Type Counts"

    type: sum
    sql: ${TABLE}.count_data_strategy_sprint_type ;;
  }

  measure: count_data_integration_sprint_type {
    group_label: "Deal Sprint Type Counts"

    type: sum
    sql: ${TABLE}.count_data_integration_sprint_type ;;
  }

  measure: count_data_collection_sprint_type {
    group_label: "Deal Sprint Type Counts"

    type: sum
    sql: ${TABLE}.count_data_collection_sprint_type ;;
  }

  measure: count_looker_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_looker_product_in_solution ;;
  }

  measure: count_dbt_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_dbt_product_in_solution ;;
  }

  measure: count_stitch_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_stitch_product_in_solution ;;
  }

  measure: count_segment_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_segment_product_in_solution ;;
  }

  measure: count_gcp_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_gcp_product_in_solution ;;
  }

  measure: count_snowflake_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_snowflake_product_in_solution ;;
  }

  measure: count_fivetran_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_fivetran_product_in_solution ;;
  }

  measure: count_qubit_product_in_solution {
    group_label: "Deal Technology Counts"

    type: sum
    sql: ${TABLE}.count_qubit_product_in_solution ;;
  }

  measure: count_partner_referral_source {
    group_label: "Deal Source Counts"

    type: sum
    sql: ${TABLE}.count_partner_referral_source ;;
  }

  measure: count_ceo_network_source {
    group_label: "Deal Source Counts"

    type: sum
    sql: ${TABLE}.count_ceo_network_source ;;
  }

  measure: count_staff_referral_referral_source {
    group_label: "Deal Source Counts"

    type: sum
    sql: ${TABLE}.count_staff_referral_referral_source ;;
  }

  measure: count_organic_search_source {
    group_label: "Deal Source Counts"

    type: sum
    sql: ${TABLE}.count_organic_search_source ;;
  }

  measure: count_repeat_customer_source {
    group_label: "Deal Source Counts"

    type: sum
    sql: ${TABLE}.count_repeat_customer_source ;;
  }

  measure: count_paid_search_source {
    group_label: "Deal Source Counts"

    type: sum
    sql: ${TABLE}.count_paid_search_source ;;
  }

  dimension: associatedcompanyids {
    hidden: yes
    type: number
    sql: ${TABLE}.associatedcompanyids ;;
  }

  dimension: deal_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.deal_id ;;
  }



  dimension: probability {
    hidden: yes

    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: weighted_pipeline_amount {
    hidden: yes

    type: number
    sql: ${TABLE}.amount * ${TABLE}.probability ;;
  }

  measure: weighted_amount {
    group_label: "Deals"
    value_format_name: gbp

    type: sum
    sql: ${weighted_pipeline_amount} ;;
  }

  filter: is_closed_won {
    label: "Deal Closed Won"
    default_value: "Yes"

    type: yesno
    sql: ${TABLE}.closedwon ;;
  }

  dimension: stage_label {
    group_label: "Deals"
    group_item_label: "Funnel Stage"
    label: "Deal Funnel Stage"
    type: string
    sql: ${TABLE}.stage_label ;;
    order_by_field: stage_displayorder
  }

  dimension: stage_displayorder {
    hidden: yes
    type: number
    sql: ${TABLE}.stage_displayorder ;;
  }

  dimension: pk {
    hidden: yes

    type: string
    sql: ${TABLE}.pk ;;
  }

  dimension: pipeline_label {
    group_item_label: "Pipeline"
    label: "Sales Pipeline"
    type: string
    sql: ${TABLE}.pipeline_label ;;
    order_by_field: pipeline_displayorder
  }

  dimension: pipeline_displayorder {
    type: number
    hidden: yes
    sql: ${TABLE}.pipeline_displayorder ;;
  }

  filter: pipeline_active {
    hidden: yes
    default_value: "Yes"
    type: yesno
    sql: ${TABLE}.pipeline_active ;;
  }

  set: detail {
    fields: [
      sales_email_last_replied_time,
      closed_lost_reason,
      dealname,
      hubspot_owner_id,
      hubspot_owner_email,
      lastmodifieddate_time,
      notes_last_updated_time,
      dealstage,
      dealstage_id,
      pipeline,
      amount,
      notes_last_contacted_time,
      amount_in_home_currency,
      hubspot_owner_assigneddate_time,
      num_notes,
      description,
      source,
      salesperson_email,
      is_closed,
      pricing_model,
      deal_source,
      products_in_solution,
      sprint_type,
      days_to_close,
      partner_referral_type,
      deal_components,
      deal_type,
      count_data_strategy_sprint_type,
      count_data_integration_sprint_type,
      count_data_collection_sprint_type,
      count_looker_product_in_solution,
      count_dbt_product_in_solution,
      count_stitch_product_in_solution,
      count_segment_product_in_solution,
      count_gcp_product_in_solution,
      count_snowflake_product_in_solution,
      count_fivetran_product_in_solution,
      count_qubit_product_in_solution,
      count_partner_referral_source,
      count_ceo_network_source,
      count_staff_referral_referral_source,
      count_organic_search_source,
      count_repeat_customer_source,
      count_paid_search_source,
      associatedcompanyids,
      deal_id,
      probability,
      closedwon,
      stage_label,
      stage_displayorder,
      pk,
      pipeline_label,
      pipeline_displayorder,
      pipeline_active
    ]
  }
}
