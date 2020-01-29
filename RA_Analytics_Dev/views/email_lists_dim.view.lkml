view: email_lists_dim {
  sql_table_name: ra_data_warehouse_dbt_dev.email_lists_dim ;;

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

  dimension: default_from_address1 {
    type: string
    sql: ${TABLE}.default_from_address1 ;;
  }

  dimension: default_from_address2 {
    type: string
    sql: ${TABLE}.default_from_address2 ;;
  }

  dimension: default_from_city {
    type: string
    sql: ${TABLE}.default_from_city ;;
  }

  dimension: default_from_company {
    type: string
    sql: ${TABLE}.default_from_company ;;
  }

  dimension: default_from_country {
    type: string
    sql: ${TABLE}.default_from_country ;;
  }

  dimension: default_from_email {
    type: string
    sql: ${TABLE}.default_from_email ;;
  }

  dimension: default_from_name {
    type: string
    sql: ${TABLE}.default_from_name ;;
  }

  dimension: default_from_phone {
    type: string
    sql: ${TABLE}.default_from_phone ;;
  }

  dimension: default_from_state {
    type: string
    sql: ${TABLE}.default_from_state ;;
  }

  dimension: default_from_zip {
    type: string
    sql: ${TABLE}.default_from_zip ;;
  }

  dimension: default_language {
    type: string
    sql: ${TABLE}.default_language ;;
  }

  dimension: default_subject {
    type: string
    sql: ${TABLE}.default_subject ;;
  }

  dimension_group: last_sub {
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
    sql: ${TABLE}.last_sub_date ;;
  }

  dimension_group: last_unsub {
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
    sql: ${TABLE}.last_unsub_date ;;
  }

  dimension: list_id {
    type: string
    sql: ${TABLE}.list_id ;;
  }

  dimension_group: max_sdc_batched {
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
    sql: ${TABLE}.max_sdc_batched_at ;;
  }

  dimension: member_count {
    type: number
    sql: ${TABLE}.member_count ;;
  }

  dimension: member_count_since_send {
    type: number
    sql: ${TABLE}.member_count_since_send ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: open_rate {
    type: number
    sql: ${TABLE}.open_rate ;;
  }

  dimension: subscribe_url_long {
    type: string
    sql: ${TABLE}.subscribe_url_long ;;
  }

  dimension: target_sub_rate {
    type: number
    sql: ${TABLE}.target_sub_rate ;;
  }

  dimension: unsubscribe_count {
    type: number
    sql: ${TABLE}.unsubscribe_count ;;
  }

  dimension: unsubscribe_count_since_send {
    type: number
    sql: ${TABLE}.unsubscribe_count_since_send ;;
  }

  dimension: visibility {
    type: string
    sql: ${TABLE}.visibility ;;
  }

  measure: count {
    type: count
    drill_fields: [default_from_name, name]
  }
}
