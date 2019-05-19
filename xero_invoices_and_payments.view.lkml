view: xero_invoices_and_payments {
  sql_table_name: xero_invoices_and_payments ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat(${TABLE}.invoiceid,${TABLE}.lineitemid) ;;
  }

  dimension: amountdue {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.amountdue ;;
  }

  dimension: xero_company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.xero_company_id ;;
  }

  measure: total_amount_still_due {
    group_label: "Invoice Details"

    type: sum_distinct
    sql_distinct_key: ${invoiceid} ;;
    value_format_name: gbp_0

    sql: ${TABLE}.amountdue ;;
  }

  measure: total_amount_paid {
    group_label: "Payment Details"

    type: sum_distinct
    sql_distinct_key: ${invoiceid} ;;
    value_format_name: gbp_0
    sql: ${TABLE}.amountpaid ;;
  }

  dimension: amountpaid {
    group_label: "Payment Details"

    type: number
    value_format_name: id
    sql: ${TABLE}.amountpaid ;;
  }

  dimension_group: datestring {
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
    sql: ${TABLE}.datestring ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: duedate {
    group_label: "Invoice Details"
    label: "Invoice Due"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.duedate ;;
  }



  dimension_group: fullypaidondate {
    label: "Invoice Fully Paid"
    group_label: "Payment Details"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.fullypaidondate ;;
  }

  dimension: invoice_currency_code {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.invoice_currency_code ;;
  }

  dimension_group: invoice {
    group_label: "Invoice Details"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: invoice_reference {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.invoice_reference ;;
  }

  dimension: invoice_status {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.invoice_status ;;
  }

  dimension: invoice_type {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.invoice_type ;;
  }

  dimension: invoiceid {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.invoiceid ;;
  }

  dimension: invoicenumber {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.invoicenumber ;;
  }

  dimension: isdiscounted {
    group_label: "Invoice Details"

    type: yesno
    sql: ${TABLE}.isdiscounted ;;
  }

  dimension: itemcode {
    group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.itemcode ;;
  }

  dimension: lineamount {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.lineamount ;;
  }



  dimension_group: payment {
    group_label: "Payment Details"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.payment_date ;;
  }

  dimension: payment_reference {
    group_label: "Payment Details"

    type: string
    sql: ${TABLE}.payment_reference ;;
  }

  dimension: paymentid {
    group_label: "Payment Details"

    type: string
    sql: ${TABLE}.paymentid ;;
  }

  dimension: quantity {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: subtotal {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension: taxamount {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.taxamount ;;
  }

  dimension: taxtype {
  group_label: "Invoice Details"

    type: string
    sql: ${TABLE}.taxtype ;;
  }

  dimension: total {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.total ;;
  }

  measure: total_invoice_amount {
    group_label: "Invoice Details"

     type: sum_distinct
    sql_distinct_key: ${invoiceid} ;;
    value_format_name: gbp_0
    sql: ${TABLE}.total ;;
  }

  dimension: total_payment_amount {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.total_payment_amount ;;
  }

  dimension: totaltax {
    group_label: "Invoice Details"


    type: number
    sql: ${TABLE}.totaltax ;;
  }

  dimension: unitamount {
    group_label: "Invoice Details"

    type: number
    sql: ${TABLE}.unitamount ;;
  }


}