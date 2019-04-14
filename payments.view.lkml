view: payments {
  sql_table_name: xero.payments ;;

  dimension: paymentid {
    primary_key: yes
    type: string
    sql: ${TABLE}.paymentid ;;
  }

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

  dimension: account {
    hidden: yes
    sql: ${TABLE}.account ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bankamount {
    type: number
    sql: ${TABLE}.bankamount ;;
  }

  dimension: currencyrate {
    type: number
    sql: ${TABLE}.currencyrate ;;
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

  dimension: hasaccount {
    type: yesno
    sql: ${TABLE}.hasaccount ;;
  }

  dimension: hasvalidationerrors {
    type: yesno
    sql: ${TABLE}.hasvalidationerrors ;;
  }

  dimension: invoice {
    hidden: yes
    sql: ${TABLE}.invoice ;;
  }

  dimension: isreconciled {
    type: yesno
    sql: ${TABLE}.isreconciled ;;
  }

  dimension: paymenttype {
    type: string
    sql: ${TABLE}.paymenttype ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
    drill_fields: [paymentid]
  }
}

view: payments__invoice {
  dimension: contact {
    hidden: yes
    sql: ${TABLE}.contact ;;
  }

  dimension: currencycode {
    type: string
    sql: ${TABLE}.currencycode ;;
  }

  dimension: haserrors {
    type: yesno
    sql: ${TABLE}.haserrors ;;
  }

  dimension: invoiceid {
    type: string
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: payments__invoice__contact {
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

view: payments__account {
  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }
}
