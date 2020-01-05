view: customer_events {
  view_label: "Events"
  sql_table_name: ra_data_warehouse_dbt_prod.customer_events ;;



  filter: billable_client {
    hidden: yes
    default_value: "Yes"
    type: yesno
    sql: ${TABLE}.billable_client ;;
  }



  filter: sales_prospect {
    type: yesno
    hidden: no

    sql: ${TABLE}.sales_prospect ;;

  }

  dimension: customer_id {

    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    hidden: yes
    sql: ${customer_master.customer_name} ;;
  }

  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: concat(cast(${customer_id} as string),cast(${event_seq} as string)) ;;
  }



  dimension: days_since_last_billable_day {
    group_label: "Customer Retention"
    type: number
    sql: ${TABLE}.days_since_last_billable_day ;;
  }

  dimension: churn_status {
    group_label: "Customer Retention"
    type: string
    sql: case when ${TABLE}.days_since_last_billable_day < 30 then 'Active'
              when ${TABLE}.days_since_last_billable_day between 30 and 89 then 'Inactive'
              when ${TABLE}.days_since_last_billable_day between 90 and 180 then 'Dormant'
              when ${TABLE}.days_since_last_billable_day > 180 then 'Churned'
              else 'n/a' end;;

  }

  dimension: days_since_last_incoming_email {
    group_label: "Customer Retention"
    hidden: yes

    type: number
    sql: ${TABLE}.days_since_last_incoming_email ;;
  }

  dimension: days_since_last_outgoing_email {
    group_label: "Customer Retention"
    hidden: yes


    type: number
    sql: ${TABLE}.days_since_last_outgoing_email ;;
  }

  dimension: time_since_last_email_contact {
    group_label: "Customer Retention"
    type: string
    sql: case when ${TABLE}.days_since_last_billable_day < 30 then 'This month'
    when ${TABLE}.days_since_last_billable_day between 30 and 89 then 'Last 3 Months'
    when ${TABLE}.days_since_last_billable_day between 90 and 180 then 'Last 6 Months'
    when ${TABLE}.days_since_last_billable_day > 180 then '>6 Months Ago'
    else 'n/a' end;;
  }

  dimension: event_details {
    group_label: "Client Events"

    type: string
    sql: ${TABLE}.event_details ;;
  }

  dimension: event_seq {
    group_label: "Customer Retention"

    type: number
    sql: ${TABLE}.event_seq ;;
  }

  dimension_group: event_ts {
    group_label: "Client Events"

    label: "Event"
    type: time
    timeframes: [
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      week_of_year,
      week,
      month
    ]
    sql: ${TABLE}.event_ts ;;
  }

  dimension: event_type {
    group_label: "Client Events"

    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: event_value {
    hidden: yes
    type: number
    sql: ${TABLE}.event_value ;;
  }

  dimension: event_units {
    hidden: yes
    type: number
    sql: ${TABLE}.event_value ;;
  }

  measure: total_event_value {
    group_label: "Client Events"

    hidden: no
    type: sum
    value_format: "#.##"
    sql: ${TABLE}.event_value  ;;
    }

  measure: total_event_units {
    group_label: "Client Events"

    hidden: no
    type: sum
    value_format: "#.##"
    sql: ${TABLE}.event_units  ;;
  }

  measure: total_days_billed {
    group_label: "Client Metrics"

    hidden: no
    type: sum
    value_format: "#.##"
    sql: ${TABLE}.event_value  ;;
    filters: {field: event_type
              value: "Billable Day"}
  }

  dimension: revenue_billed {
    type: number
    hidden: yes
    value_format: "#.##"
    sql: case when ${TABLE}.event_type = 'Billable Day' then ${TABLE}.event_value*${TABLE}.event_units end ;;
  }

  measure: total_revenue_billed {
    hidden: yes
    type: sum
    value_format: "#.##"
    sql: ${revenue_billed}  ;;
  }

  measure: total_revenue_invoiced
  {hidden: yes
    type: sum
    value_format: "#.##"
    sql: ${TABLE}.event_value  ;;
    filters: {field: event_type
      value: "Client Invoiced"}
  }

  measure: total_revenue_paid
  {hidden: yes
    type: sum
    value_format: "#.##"
    sql: ${TABLE}.event_value  ;;
    filters: {field: event_type
      value: "Client Paid"}
  }

  measure: total_looker_usage_mins

  {    group_label: "Client Metrics"

    hidden: no
    type: sum
    value_format: "#.##"
    sql: ${TABLE}.event_value  ;;
    filters: {field: event_type
      value: "daily_looker_usage_mins"}
  }








  measure: total_events {
    hidden: no
    type: sum
    sql: 1 ;;
  }



  dimension_group: first_billable_day_ts {
    label: "Customer Since"
    group_label: "Customer Retention"
    hidden: yes
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}.first_billable_day_ts ;;
  }

  measure: total_new_active_customers {
    group_label: "Customer Retention"
    type: count_distinct
    sql: case when (${event_ts_month} = ${first_billable_day_ts_month}) and ${event_type} in ('Billable Day','Non-Billable Day') then ${customer_id} end ;;
  }

  measure: total_retained_reactivated_active_customers {
    group_label: "Customer Retention"
    type: count_distinct
    sql: case when (${event_ts_month} != ${first_billable_day_ts_month}) and ${event_type} in ('Billable Day','Non-Billable Day') then ${customer_id} end ;;
  }

  measure: total_active_customers {
    group_label: "Customer Retention"
    type: count_distinct
    sql: case when ${event_type} in ('Billable Day','Non-Billable Day') then ${customer_id} end ;;
  }

  dimension_group: first_invoice_day_ts {
    type: time
    hidden: no
    timeframes: [
      month,
      quarter
    ]
    sql: ${TABLE}.first_invoice_day_ts ;;
  }

  dimension_group: last_billable_day_ts {
    hidden: yes

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
    sql: ${TABLE}.last_billable_day_ts ;;
  }

  dimension_group: last_invoice_day_ts {
    hidden: yes

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
    sql: ${TABLE}.last_invoice_day_ts ;;
  }

  dimension: months_since_first_billable_day {
    group_label: "Customer Retention"

    type: number
    sql: ${TABLE}.months_since_first_billable_day ;;
  }

  dimension: weeks_since_first_billable_day {
    group_label: "Customer Retention"

    type: number
    sql: ${TABLE}.weeks_since_first_billable_day ;;
  }

  dimension: months_since_first_contact_day {
    group_label: "Customer Retention"

    type: number
    sql: ${TABLE}.months_since_first_contact_day ;;
  }

  dimension: weeks_since_first_contact_day {
    group_label: "Customer Retention"

    type: number
    sql: ${TABLE}.weeks_since_first_contact_day ;;
  }




}
