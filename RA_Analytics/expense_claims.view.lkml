view: expense_claims {
  sql_table_name: xero.expense_claims ;;

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

  dimension: amountdue {
    type: number
    sql: ${TABLE}.amountdue ;;
  }

  dimension: amountpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.amountpaid ;;
  }

  dimension: expenseclaimid {
    type: string
    sql: ${TABLE}.expenseclaimid ;;
  }

  dimension_group: paymentduedate {
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
    sql: ${TABLE}.paymentduedate ;;
  }

  dimension_group: reportingdate {
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
    sql: ${TABLE}.reportingdate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
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

  dimension: user {
    hidden: yes
    sql: ${TABLE}.user ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: expense_claims__user {
  dimension: emailaddress {
    type: string
    sql: ${TABLE}.emailaddress ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: issubscriber {
    type: yesno
    sql: ${TABLE}.issubscriber ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: organisationrole {
    type: string
    sql: ${TABLE}.organisationrole ;;
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

  dimension: userid {
    type: string
    sql: ${TABLE}.userid ;;
  }
}
