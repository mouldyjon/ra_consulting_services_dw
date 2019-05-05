view: invoices {
  sql_table_name: ra_data_warehouse.harvest_invoices ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

 dimension_group: project_invoice_period_start {
   type: time
  timeframes: [
    date,
    week,
    month
  ]
  sql: ${TABLE}.period_start;;
 }

  dimension: was_paid_ontime {
    type: yesno
  }

  dimension: is_paid {
    type: yesno
    sql: case when ${TABLE}.paid_date is not null then true else false end;;
  }

  dimension_group: project_invoice_period_end {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.period_end;;
  }

  dimension: amount {
    type: number
    hidden: yes

    sql: ${TABLE}.amount ;;
  }

  measure: total_project_invoice_amount {
    type: sum_distinct
    hidden: no
    value_format_name: gbp_0
    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.amount ;;
  }

  dimension: client_id {
    type: number
    hidden: yes

    sql: ${TABLE}.client_id ;;
  }

  dimension: client_key {
    type: string
    hidden: yes

    sql: ${TABLE}.client_key ;;
  }

  dimension_group: project_invoice_created {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: creator_id {
    hidden: yes

    type: number
    sql: ${TABLE}.creator_id ;;
  }

  dimension: project_invoice_currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: discount_amount {
    hidden: yes

    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  measure: total_project_invoice_discount_amount {
    hidden: no

    type: sum_distinct
    value_format_name: gbp_0

    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.discount_amount ;;
  }

  dimension: due_amount {
    hidden: yes
    value_format_name: gbp_0

    type: number
    sql: ${TABLE}.due_amount ;;
  }

  measure: total_project_invoice_due_amount {
    hidden: no

    type: sum_distinct
    value_format_name: gbp_0

    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.due_amount ;;
  }

  dimension_group: project_invoice_due {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: project_invoice_issue {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.issue_date ;;
  }

  dimension: project_invoice_notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: project_invoice_number {
    type: string
    sql: ${TABLE}.number ;;
  }



  dimension_group: project_invoice_paid {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.paid_date ;;
  }

  dimension: project_invoice_payment_term {
    type: string
    sql: ${TABLE}.payment_term ;;
  }





  dimension: project_invoice_purchase_order {
    type: string
    sql: ${TABLE}.purchase_order ;;
  }

  dimension_group: project_invoice_sent {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.sent_at ;;
  }



  dimension: project_invoice_subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: project_invoice_tax {
    type: string
    sql: ${TABLE}.tax ;;
  }



  dimension: tax_amount {
    hidden: yes

    type: number
    value_format_name: gbp_0

    sql: ${TABLE}.tax_amount ;;
  }

  measure: total_project_invoice_tax_amount {
    hidden: no

    type: sum_distinct
    sql_distinct_key: ${id} ;;
    value_format_name: gbp_0

    sql: ${TABLE}.tax_amount ;;
  }

  dimension_group: project_invoice_updated {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count_project_invoices {
    type: count_distinct
    sql: ${id} ;;

    drill_fields: [id]
  }
}