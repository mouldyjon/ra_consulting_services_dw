view: tax_rates {
  sql_table_name: xero.tax_rates ;;

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

  dimension: canapplytoassets {
    type: yesno
    sql: ${TABLE}.canapplytoassets ;;
  }

  dimension: canapplytoequity {
    type: yesno
    sql: ${TABLE}.canapplytoequity ;;
  }

  dimension: canapplytoexpenses {
    type: yesno
    sql: ${TABLE}.canapplytoexpenses ;;
  }

  dimension: canapplytoliabilities {
    type: yesno
    sql: ${TABLE}.canapplytoliabilities ;;
  }

  dimension: canapplytorevenue {
    type: yesno
    sql: ${TABLE}.canapplytorevenue ;;
  }

  dimension: displaytaxrate {
    type: number
    sql: ${TABLE}.displaytaxrate ;;
  }

  dimension: effectiverate {
    type: number
    sql: ${TABLE}.effectiverate ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reporttaxtype {
    type: string
    sql: ${TABLE}.reporttaxtype ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: taxcomponents {
    hidden: yes
    sql: ${TABLE}.taxcomponents ;;
  }

  dimension: taxtype {
    type: string
    sql: ${TABLE}.taxtype ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}

view: tax_rates__taxcomponents {
  dimension: iscompound {
    type: yesno
    sql: ${TABLE}.iscompound ;;
  }

  dimension: isnonrecoverable {
    type: yesno
    sql: ${TABLE}.isnonrecoverable ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: rate {
    type: number
    sql: ${TABLE}.rate ;;
  }
}
