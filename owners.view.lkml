view: owners {
  sql_table_name: stitch_hubspot.owners ;;

  dimension: remotelist__ownerid {
    primary_key: yes
    type: number
    sql: ${TABLE}.remotelist.ownerid ;;
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

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
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

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: hascontactsaccess {
    type: yesno
    sql: ${TABLE}.hascontactsaccess ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: ownerid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.ownerid ;;
  }

  dimension: portalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.portalid ;;
  }

  dimension: remotelist {
    hidden: yes
    sql: ${TABLE}.remotelist ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      remotelist__ownerid,
      firstname,
      lastname,
      owners.firstname,
      owners.lastname,
      owners.count
    ]
  }
}

view: owners__remotelist {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: ownerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ownerid ;;
  }

  dimension: portalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.portalid ;;
  }

  dimension: remoteid {
    type: string
    sql: ${TABLE}.remoteid ;;
  }

  dimension: remotetype {
    type: string
    sql: ${TABLE}.remotetype ;;
  }
}
