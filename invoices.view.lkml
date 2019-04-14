view: invoices {
  sql_table_name: xero.invoices ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }









  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amountcredited {
    type: number
    sql: ${TABLE}.amountcredited ;;
  }

  dimension: amountdue {
    type: number
    sql: ${TABLE}.amountdue ;;
  }

  dimension: amountpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.amountpaid ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_key {
    type: string
    sql: ${TABLE}.client_key ;;
  }

  dimension: contact {
    hidden: yes
    sql: ${TABLE}.contact ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: creator_id {
    type: number
    sql: ${TABLE}.creator_id ;;
  }

  dimension: creditnotes {
    hidden: yes
    sql: ${TABLE}.creditnotes ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currencycode {
    type: string
    sql: ${TABLE}.currencycode ;;
  }

  dimension: currencyrate {
    type: number
    sql: ${TABLE}.currencyrate ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }



  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: due_amount {
    type: number
    sql: ${TABLE}.due_amount ;;
  }

  dimension_group: due {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.due_date ;;
  }

  dimension_group: duedate {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.duedate ;;
  }



  dimension_group: fullypaidondate {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.fullypaidondate ;;
  }

  dimension: hasattachments {
    type: yesno
    sql: ${TABLE}.hasattachments ;;
  }

  dimension: haserrors {
    type: yesno
    sql: ${TABLE}.haserrors ;;
  }

  dimension: invoiceid {
    type: string
    # hidden: yes
    sql: ${TABLE}.invoiceid ;;
  }

  dimension: invoicenumber {
    type: string
    sql: ${TABLE}.invoicenumber ;;
  }

  dimension: isdiscounted {
    type: yesno
    sql: ${TABLE}.isdiscounted ;;
  }

  dimension_group: issue {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.issue_date ;;
  }

  dimension: lineamounttypes {
    type: string
    sql: ${TABLE}.lineamounttypes ;;
  }

  dimension: lineitems {
    hidden: yes
    sql: ${TABLE}.lineitems ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }



  dimension_group: paid {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.paid_date ;;
  }

  dimension: payment_term {
    type: string
    sql: ${TABLE}.payment_term ;;
  }

  dimension: payments {
    hidden: yes
    sql: ${TABLE}.payments ;;
  }





  dimension: purchase_order {
    type: string
    sql: ${TABLE}.purchase_order ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension: senttocontact {
    type: yesno
    sql: ${TABLE}.senttocontact ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension: tax {
    type: string
    sql: ${TABLE}.tax ;;
  }

  dimension: tax2_amount {
    type: number
    sql: ${TABLE}.tax2_amount ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: totaltax {
    type: number
    sql: ${TABLE}.totaltax ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated_at ;;
  }



  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count

  }
  }

  # ----- Sets of fields for drilling ------
