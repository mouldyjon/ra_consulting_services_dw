view: purchase_orders {
  sql_table_name: xero.purchase_orders ;;

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

  dimension: attentionto {
    type: string
    sql: ${TABLE}.attentionto ;;
  }

  dimension: brandingthemeid {
    type: string
    sql: ${TABLE}.brandingthemeid ;;
  }

  dimension: contact {
    hidden: yes
    sql: ${TABLE}.contact ;;
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

  dimension: deliveryaddress {
    type: string
    sql: ${TABLE}.deliveryaddress ;;
  }

  dimension_group: deliverydate {
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
    sql: ${TABLE}.deliverydate ;;
  }

  dimension_group: deliverydatestring {
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
    sql: ${TABLE}.deliverydatestring ;;
  }

  dimension: deliveryinstructions {
    type: string
    sql: ${TABLE}.deliveryinstructions ;;
  }

  dimension: hasattachments {
    type: yesno
    sql: ${TABLE}.hasattachments ;;
  }

  dimension: haserrors {
    type: yesno
    sql: ${TABLE}.haserrors ;;
  }

  dimension: isdiscounted {
    type: yesno
    sql: ${TABLE}.isdiscounted ;;
  }

  dimension: lineamounttypes {
    type: string
    sql: ${TABLE}.lineamounttypes ;;
  }

  dimension: lineitems {
    hidden: yes
    sql: ${TABLE}.lineitems ;;
  }

  dimension: purchaseorderid {
    type: string
    sql: ${TABLE}.purchaseorderid ;;
  }

  dimension: purchaseordernumber {
    type: string
    sql: ${TABLE}.purchaseordernumber ;;
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

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
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

view: purchase_orders__contact {
  dimension: contactid {
    type: string
    sql: ${TABLE}.contactid ;;
  }

  dimension: contactstatus {
    type: string
    sql: ${TABLE}.contactstatus ;;
  }

  dimension: defaultcurrency {
    type: string
    sql: ${TABLE}.defaultcurrency ;;
  }

  dimension: hasvalidationerrors {
    type: yesno
    sql: ${TABLE}.hasvalidationerrors ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
}

view: purchase_orders__lineitems {
  dimension: accountcode {
    type: string
    sql: ${TABLE}.accountcode ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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
