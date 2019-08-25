view: deals {
  sql_table_name: ra_data_warehouse_dbt_prod.deals ;;
  view_label: "Hubspot Deal Tracking"

  dimension: deal_id {
    primary_key: yes
    type: number
    hidden: yes
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
    label: "Opportunity Value"
    sql_distinct_key: ${deal_id} ;;
    sql: ${TABLE}.amount ;;
    action: {
      label: "Refresh using Stitch and dbt"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obn1e8q/"
      icon_url: "https://www.google.com/s2/favicons?domain=stitchdata.com"
    }
    action: {
      label: "Update Opportunity Value"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obfjliw/"
      icon_url: "http://app.hubspot.com/favicon.ico"

      param: {
        name: "deal_name"
        value: "{{ deals.opportunity_name._value }}"
      }
      param: {
        name: "deal_id"
        value: "{{ deals.deal_id._value }}"
      }
      form_param: {
        name: "new_opportunity_amount"
        type: string
        label: "Updated Opportunity Value"
        description: "Specify Updated Opportunity Stage"
        required: yes
      }
    }
  }

  measure: total_closed_opportunity_amount {
    type: sum_distinct
    value_format_name: gbp_0
    label: "Total Closed Won Opportunity Value"
    sql_distinct_key: ${deal_id} ;;
    sql: case when ${sales_opportunity_stage} like '%Sales Closed Won%' then ${amount} end ;;
  }

  measure: total_open_opportunity_amount {
    type: number
    value_format_name: gbp_0
    label: "Total Open Opportunity Value"
    sql: ${total_opportunity_amount} - ${total_closed_lost_opportunity_amount} - ${total_closed_opportunity_amount} ;;
  }

  measure: total_closed_lost_opportunity_amount {
    type: sum_distinct
    value_format_name: gbp_0
    label: "Total Closed Lost Opportunity Value"
    sql_distinct_key: ${deal_id} ;;
    sql: ${amount} ;;
    filters: {field: sales_opportunity_stage
      value: "Sales Closed Lost"}
  }

  measure: total_weighted_opportunity_amount {
    type: sum_distinct
    value_format_name: gbp_0
    label: "Weighted Opportunity Value"
    sql_distinct_key: ${deal_id} ;;
    sql: ${pipeline_weighted_amount} ;;
  }

  measure: avg_opportunity_amount {
    type: average
    hidden: yes
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

  dimension: hubspot_owner_email {
    hidden: no
    type: string
    sql: "mark@rittman.co.uk" ;;
  }


  dimension: closed_lost_reason {
    group_label: "Opportunity Status"
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension_group: opportunity_closed {
    group_label: "Opportunity Status"
    label: "Opportunity Close"
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
    label: "Opportunity Created"
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.createdate ;;
  }

  dimension: opportunity_name {

    type: string
    sql: ${TABLE}.dealname ;;
    action: {
      label: "Refresh using Stitch and dbt"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obn1e8q/"
      icon_url: "https://www.google.com/s2/favicons?domain=stitchdata.com"
    }
    link: {
      label: "View Deal in Hubspot"
      url: "https://app.hubspot.com/contacts/4402794/deal/{{ deals.deal_id._value }}/"
      icon_url: "http://app.hubspot.com/favicon.ico"
    }
    link: {
      label: "View Company in Hubspot"
      url: "https://app.hubspot.com/contacts/4402794/company/{{ customer_master.hubspot_company_id._value }}/"
      icon_url: "http://app.hubspot.com/favicon.ico"
    }
    action: {
      label: "Request status update from BDM"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obfjj2v/"
      icon_url: "http://app.hubspot.com/favicon.ico"

      param: {
        name: "deal_name"
        value: "{{ deals.opportunity_name._value }}"
      }
      param: {
        name: "deal_id"
        value: "{{ deals.deal_id._value }}"
      }
      param: {
        name: "hubspot_owner_email"
        value: "{{ deals.hubspot_owner_email._value }}"
      }
      form_param: {
        name: "request_message"
        type: string
        label: "Message to BDM"
        description: "Add note to BDM status update request"
        required: yes
      }
    }


  }


  dimension: sales_opportunity_stage_sort_index {
    type: number
    hidden: yes
    sql: ${TABLE}.dealstage_sortindex ;;
  }

  dimension: dealstage_id {
    type: string
    hidden: yes
    sql: ${TABLE}.deadstage_id ;;
  }

  dimension: sales_opportunity_stage {
    group_label: "Opportunity Status"
label: "Opportunity Deal Stage"
    type: string
    sql: ${TABLE}.dealstage ;;
    order_by_field: sales_opportunity_stage_sort_index
    action: {
      label: "Refresh using Stitch and dbt"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obn1e8q/"
      icon_url: "https://www.google.com/s2/favicons?domain=stitchdata.com"
    }
    action: {
      label: "Update Deal Status"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obfqxpo/"
      icon_url: "http://app.hubspot.com/favicon.ico"

      param: {
        name: "deal_name"
        value: "{{ deals.opportunity_name._value }}"
        }
      param: {
        name: "deal_id"
        value: "{{ deals.deal_id._value }}"
      }
      form_param: {
        name: "new_deal_stage"
        type: select
        label: "New Deal Stage"
        description: "Specify New Deal Stage"
        required: yes
        option: {
          name: "appointmentscheduled"
          label: "Initial Inbound Enquiry"
        }
        option: {
          name: "qualifiedtobuy"
          label: "Initial Meeting & Presentation"
        }
        option: {
          name: "presentationscheduled"
          label: "Proposal Sent"
        }
        option: {
          name: "553a886b-24bc-4ec4-bca3-b1b7fcd9e1c7"
          label: "Deal Verbally Closed subject to SoW + MSA"
        }
        option: {
          name: "closedwon"
          label: "Sales Closed Won"
        }
        option: {
          name: "closedlost"
          label: "Sales Closed Lost"
        }
        option: {
          name: "presentationscheduled"
          label: "Proposal Sent"
        }

      }
    }
  }

  filter: open_opportunity {
    type: yesno
    sql: case when (${TABLE}.dealstage like '%Sales Closed%' or ${TABLE}.dealstage is null) then false else true end;;
  }

  dimension: sales_opportunity_stage_pipeline_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.dealstage_pipeline_modifier ;;

  }



  dimension: sales_opportunity_type {
    group_label: "Opportunity Details"
    label: "New or Existing Business"
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
    label: "Last Contact"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.notes_last_contacted ;;
  }

  dimension_group: notes_last_updated {
    group_label: "Opportunity Details"
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
    type: time
    group_label: "Opportunity Details"

    timeframes: [
      date
    ]
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  measure: count_sales_opportunities {
    group_label: "Sales Metrics"
    label: "Count of Opportunities"
    type: count_distinct
    sql: ${deal_id} ;;
  }

  dimension: days_to_close {
    hidden: yes
    type: number
    sql: case when ${TABLE}.closedate is not null then date_diff(date(${TABLE}.closedate),date(${TABLE}.createdate),DAY) end;;
  }

  measure: avg_days_to_close {
    group_label: "Sales Metrics"

    type: average
    sql: ${days_to_close} ;;
  }


  measure: count_closed_sales_opportunities {
    group_label: "Sales Metrics"

    label: "Count Closed Won"
    type: count_distinct
    sql: case when ${sales_opportunity_stage} like '%Sales Closed Won%' then ${deal_id} end ;;
  }

  measure: count_lost_sales_opportunities {
    label: "Count Closed Lost"
    group_label: "Sales Metrics"

    type: count_distinct
    sql: case when ${sales_opportunity_stage} like '%Sales Closed Lost%' then ${deal_id} end ;;
  }
}
