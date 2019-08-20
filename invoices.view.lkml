view: invoices {
  sql_table_name: ra_data_warehouse_dbt_prod.harvest_invoices ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }


 dimension_group: project_invoice_period_start {
  label: "Project Invoice Start"
  hidden: yes

  group_label: "Project Invoicing"
   type: time
  timeframes: [
    date,
    week,
    month
  ]
  sql: ${TABLE}.period_start;;
 }

  dimension: was_paid_ontime {
    group_label: "Project Invoicing"

    type: yesno
  }

  dimension: is_paid {
    group_label: "Project Invoicing"

    type: yesno
    sql: case when ${TABLE}.paid_date is not null then true else false end;;
  }

  dimension_group: project_invoice_period_end {
    group_label: "Project Invoicing"
    label: "Project Invoice End"
    hidden: yes
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

  measure: total_project_invoice_gross_amount {
    group_label: "Project Invoicing"
    label: "Project Invoice Gross Amount"
    type: sum_distinct
    hidden: no
    value_format_name: gbp_0
    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.amount ;;
  }

  measure: total_project_invoice_net_amount {
    group_label: "Project Invoicing"
    label: "Project Invoice Gross Amount"
    type: sum_distinct
    hidden: no
    value_format_name: gbp_0
    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.amount - ifnull(cast(${TABLE}.tax as float64),0);;
  }

  measure: total_paid_project_invoice_net_amount {
    group_label: "Project Invoicing"
    label: "Project Paid Invoice Net Amount"
    type: sum_distinct
    hidden: no
    value_format_name: gbp_0
    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.amount - ifnull(cast(${TABLE}.tax as float64),0);;
    filters: {field: is_paid
              value: "Yes"}
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
    group_label: "Project Invoicing"
    label: "Project Invoice"
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
    group_label: "Project Invoicing"

    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: discount_amount {
    hidden: yes

    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  measure: total_project_invoice_discount_amount {
    hidden: yes

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
    hidden: yes

    type: sum_distinct
    value_format_name: gbp_0

    sql_distinct_key: ${project_invoice_number} ;;

    sql: ${TABLE}.due_amount ;;
  }

  dimension_group: project_invoice_due {
    group_label: "Project Invoicing"
    hidden: yes

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: project_invoice_issue {
    group_label: "Project Invoicing"
    hidden: yes

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.issue_date ;;
  }

  dimension: project_invoice_notes {
    group_label: "Project Invoicing"
    hidden: yes

    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: project_invoice_number {
    group_label: "Project Invoicing"
    hidden: yes

    type: string
    sql: ${TABLE}.number ;;
  }



  dimension_group: project_invoice_paid {
    group_label: "Project Invoicing"
    label: "Project Invoice Paid"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.paid_date ;;
  }

  dimension: project_invoice_payment_term {
    group_label: "Project Invoicing"
    hidden: yes

    type: string
    sql: ${TABLE}.payment_term ;;
  }





  dimension: project_invoice_purchase_order {
    group_label: "Project Invoicing"
    hidden: yes

    type: string
    sql: ${TABLE}.purchase_order ;;
  }

  dimension_group: project_invoice_sent {
    group_label: "Project Invoicing"
    hidden: yes

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.sent_at ;;
  }



  dimension: project_invoice_subject {
    group_label: "Project Invoicing"

    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: project_invoice_tax {
    group_label: "Project Invoicing"
    hidden: yes

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
    hidden: yes

    type: sum_distinct
    sql_distinct_key: ${id} ;;
    value_format_name: gbp_0

    sql: ${TABLE}.tax_amount ;;
  }

  dimension_group: project_invoice_updated {
    hidden: yes
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count_project_invoices {
    group_label: "Project Invoicing"

    type: count_distinct
    sql: ${id} ;;

    drill_fields: [id]
  }
}
