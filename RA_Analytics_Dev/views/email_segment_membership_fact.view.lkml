view: email_segment_membership_fact {
  sql_table_name: ra_data_warehouse_dbt_dev.email_segment_membership_fact ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.list_member_id,${TABLE}.segment_id ${TABLE}.valid_from_raw) ;;
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

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: email_id {
    type: string
    sql: ${TABLE}.email_id ;;
  }

  dimension: list_id {
    type: string
    sql: ${TABLE}.list_id ;;
  }

  dimension: list_member_id {
    type: string
    sql: ${TABLE}.list_member_id ;;
  }

  dimension_group: opted_in {
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
    sql: ${TABLE}.opted_in_at ;;
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}.segment_id ;;
  }

  dimension: unsubscribe_reason {
    type: string
    sql: ${TABLE}.unsubscribe_reason ;;
  }

  dimension_group: valid_from {
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
    sql: ${TABLE}.valid_from ;;
  }

  dimension_group: valid_to {
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
    sql: ${TABLE}.valid_to ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
