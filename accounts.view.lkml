view: accounts {
  sql_table_name: xero.accounts ;;

  dimension: accountid {
    primary_key: yes
    type: string
    sql: ${TABLE}.accountid ;;
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

  dimension: bankaccountnumber {
    type: string
    sql: ${TABLE}.bankaccountnumber ;;
  }

  dimension: bankaccounttype {
    type: string
    sql: ${TABLE}.bankaccounttype ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: currencycode {
    type: string
    sql: ${TABLE}.currencycode ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: enablepaymentstoaccount {
    type: yesno
    sql: ${TABLE}.enablepaymentstoaccount ;;
  }

  dimension: hasattachments {
    type: yesno
    sql: ${TABLE}.hasattachments ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reportingcode {
    type: string
    sql: ${TABLE}.reportingcode ;;
  }

  dimension: reportingcodename {
    type: string
    sql: ${TABLE}.reportingcodename ;;
  }

  dimension: showinexpenseclaims {
    type: yesno
    sql: ${TABLE}.showinexpenseclaims ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: systemaccount {
    type: string
    sql: ${TABLE}.systemaccount ;;
  }

  dimension: taxtype {
    type: string
    sql: ${TABLE}.taxtype ;;
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
    drill_fields: [accountid, reportingcodename, name]
  }
}
