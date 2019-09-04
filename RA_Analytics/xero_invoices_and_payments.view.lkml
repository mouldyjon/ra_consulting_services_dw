view: xero_invoices_and_payments {
  sql_table_name: xero_invoices_and_payments ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat(${TABLE}.invoiceid,${TABLE}.lineitemid) ;;
  }

  dimension: amountdue {
    group_label: "Xero Invoicing"
    label: "Xero Invoice Amount"
    type: number
    sql: ${TABLE}.amountdue ;;
  }

  dimension: xero_company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.xero_company_id ;;
  }

  measure: total_amount_still_due {
    group_label: "Xero Invoicing"
    label: "Xero Invoice Amount Outstanding"

    type: sum_distinct
    sql_distinct_key: ${invoiceid} ;;
    value_format_name: gbp_0

    sql: ${TABLE}.amountdue ;;
  }

  measure: total_amount_paid {
    group_label: "Xero Invoicing"
    label: "Xero Invoice Amount Paid"

    type: sum_distinct
    sql_distinct_key: ${invoiceid} ;;
    value_format_name: gbp_0
    sql: ${TABLE}.amountpaid ;;
  }

  dimension: amountpaid {
    group_label: "Payment Details"
hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.amountpaid ;;
  }

  dimension_group: datestring {
    type: time
    hidden: yes
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
    group_label: "Xero Invoicing"
    label: "Xero Invoice Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: duedate {
    group_label: "Xero Invoicing"
    label: "Xero Invoice Due"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.duedate ;;
  }



  dimension_group: fullypaidondate {
    group_label: "Xero Invoicing"
    label: "Xero Invoice Paid"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.fullypaidondate ;;
  }

  dimension: invoice_currency_code {
       group_label: "Xero Invoicing"
    label: "Xero Invoice Created"
    hidden: no

    type: string
    sql: ${TABLE}.invoice_currency_code ;;
  }

  dimension_group: invoice {
    group_label: "Xero Invoicing"
    label: "Xero Invoice Created"
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
    label: "Xero Invoice Number"
hidden: yes
    type: string
    sql: ${TABLE}.invoiceid ;;
    link: {
      label: "View Invoice in Xero"
      url: "https://go.xero.com/AccountsReceivable/View.aspx?InvoiceID={{ value }}"
      icon_url: "https://www.xero.com/uk/favicon.ico"
    }
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
hidden: yes
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.payment_date ;;
  }

  dimension: payment_reference {
    group_label: "Payment Details"
    hidden: yes

    type: string
    sql: ${TABLE}.payment_reference ;;
  }

  dimension: paymentid {
    group_label: "Payment Details"
    hidden: yes

    type: string
    sql: ${TABLE}.paymentid ;;
  }

  dimension: quantity {
    group_label: "Invoice Details"
    hidden: yes

    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: subtotal {
    group_label: "Invoice Details"
    hidden: yes

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
    hidden: yes

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
hidden: yes

    type: number
    sql: ${TABLE}.totaltax ;;
  }

  dimension: unitamount {
    group_label: "Invoice Details"
hidden: yes
    type: number
    sql: ${TABLE}.unitamount ;;
  }


}
