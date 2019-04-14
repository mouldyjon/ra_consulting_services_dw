view: bank_transactions {
  sql_table_name: xero.bank_transactions ;;

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: bankaccount {
    hidden: yes
    sql: ${TABLE}.bankaccount ;;
  }

  dimension: banktransactionid {
    type: string
    sql: ${TABLE}.banktransactionid ;;
  }

  dimension: contact {
    hidden: yes
    sql: ${TABLE}.contact ;;
  }

  dimension: currencycode {
    type: string
    sql: ${TABLE}.currencycode ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
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

  dimension: hasattachments {
    type: yesno
    sql: ${TABLE}.hasattachments ;;
  }

  dimension: isreconciled {
    type: yesno
    sql: ${TABLE}.isreconciled ;;
  }

  dimension: lineamounttypes {
    type: string
    sql: ${TABLE}.lineamounttypes ;;
  }

  dimension: lineitems {
    hidden: yes
    sql: ${TABLE}.lineitems ;;
  }

  dimension: overpaymentid {
    type: string
    sql: ${TABLE}.overpaymentid ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal ;;
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

  dimension_group: updateddateutc {
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
    sql: ${TABLE}.updateddateutc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: bank_transactions__bankaccount {
  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

view: bank_transactions__lineitems {
  dimension: accountcode {
    type: string
    sql: ${TABLE}.accountcode ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: itemcode {
    type: string
    sql: ${TABLE}.itemcode ;;
  }

  dimension: lineamount {
    type: number
    sql: ${TABLE}.lineamount ;;
  }

  dimension: lineitemid {
    type: string
    sql: ${TABLE}.lineitemid ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: taxamount {
    type: number
    sql: ${TABLE}.taxamount ;;
  }

  dimension: taxtype {
    type: string
    sql: ${TABLE}.taxtype ;;
  }

  dimension: unitamount {
    type: number
    sql: ${TABLE}.unitamount ;;
  }
}

view: bank_transactions__contact {
  dimension: contactid {
    type: string
    sql: ${TABLE}.contactid ;;
  }

  dimension: contactnumber {
    type: string
    sql: ${TABLE}.contactnumber ;;
  }

  dimension: hasvalidationerrors {
    type: yesno
    sql: ${TABLE}.hasvalidationerrors ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
