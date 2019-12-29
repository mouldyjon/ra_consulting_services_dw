view: harvest_invoices {
  sql_table_name: client_invoices ;;

  dimension: id {
    primary_key: yes
    hidden: no
    type: number
    group_label: "Harvest IDs"
    label: "Harvest Invoice ID"
    sql: ${TABLE}.id ;;
  }


  dimension_group: project_invoice_period_start {
    label: "Client Harvest Invoice Start"
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
    label: "Client Harvest Invoice Was Paid on Time"

    type: yesno
  }

  dimension: is_paid {
    group_label: "Project Invoicing"
    label: "Client Harvest Invoice is Time"

    type: yesno
    sql: case when ${TABLE}.paid_date is not null then true else false end;;
  }

  dimension_group: project_invoice_period_end {
    group_label: "Project Invoicing"
    label: "Client Harvest Invoice End"
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

  dimension: net_amount {
    type: number
    hidden: yes

    sql: ${TABLE}.net_amount ;;
  }

  dimension: rechargeable_expenses {
    hidden: yes
    type: number
    sql: ${TABLE}.total_rechargeable_expenses ;;
  }

  measure: total_rechargeable_expenses {
    group_label: "Project Invoicing"

    hidden: yes
    type: sum
    sql: ${TABLE}.total_rechargeable_expenses ;;

  }

  measure: total_project_invoice_gross_amount {
    group_label: "Project Invoicing"
    label: "Client Harvest Invoice Gross Amount"
    type: sum
    hidden: yes
    value_format_name: gbp_0

    sql: ${TABLE}.amount ;;
  }

  measure: total_project_invoice_net_amount {
    group_label: "Project Invoicing"
    label: "Client Harvest Invoice Net Amount"
    type: sum
    hidden: yes
    value_format_name: gbp_0

    sql: ${TABLE}.net_amount ;;
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
    label: "Client Harvest Invoice"
    type: time
    timeframes: [week,month,quarter]
    sql: ${TABLE}.created_at ;;
  }

  dimension: creator_id {
    hidden: yes

    type: number
    sql: ${TABLE}.creator_id ;;
  }

  dimension: project_invoice_currency {
    group_label: "Project Invoicing"
    label: "Client Harvest Invoice Currency"

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

    type: sum
    value_format_name: gbp_0


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

    type: sum
    value_format_name: gbp_0


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
    label: "Client Harvest Invoice Paid"
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
    label: "Client Harvest Invoice Subject"

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

    type: sum
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
    label: "Client Harvest Invoices Count"

    type: count_distinct
    sql: ${id} ;;

    drill_fields: [id]
  }

  measure: total_amount_billed {
    group_label: "Project Invoicing"
    type: sum
    value_format_name: gbp_0

    sql: ${TABLE}.total_amount_billed ;;
  }

  measure: services_amount_billed {
    group_label: "Project Invoicing"
    type: sum
    value_format_name: gbp_0

    sql: ${TABLE}.services_amount_billed ;;
  }

  measure: expenses_amount_billed {
    group_label: "Project Invoicing"
    type: sum
    value_format_name: gbp_0

    sql: ${TABLE}.expenses_amount_billed ;;
  }

  measure: license_referral_fee_amount_billed {
    group_label: "Project Invoicing"
    type: sum
    value_format_name: gbp_0

    sql: ${TABLE}.license_referral_fee_amount_billed ;;
  }

  measure: tax_amount_billed {
    group_label: "Project Invoicing"
    type: sum
    value_format_name: gbp_0

    sql: ${TABLE}.tax_billed ;;
  }

  measure: support_amount_billed {
    group_label: "Project Invoicing"
    type: sum
    value_format_name: gbp_0

    sql: ${TABLE}.support_amount_billed ;;
  }

  dimension: months_since_first_invoice {
    group_label: "Project Invoicing"

    type: number
    sql: ${TABLE}.months_since_first_invoice ;;
  }

  dimension: client_invoice_seq_no {
    group_label: "Project Invoicing"

    type: number
    sql: ${TABLE}.client_invoice_seq_no ;;
  }

  measure: total_clients {
    group_label: "Project Invoicing"
    type: count_distinct
    sql: ${TABLE}.client_id ;;
  }
}
