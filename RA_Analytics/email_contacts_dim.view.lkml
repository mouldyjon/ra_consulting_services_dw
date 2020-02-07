view: email_contacts_dim {
  sql_table_name: ra_data_warehouse_dbt_dev.email_contacts_dim ;;

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

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.email_id, ${TABLE}.valid_from_raw) ;;
  }

  dimension: email_id {
    type: string
    sql: ${TABLE}.email_id ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: avg_click_rate {
    type: number
    sql: ${TABLE}.avg_click_rate ;;
  }

  dimension: avg_open_rate {
    type: number
    sql: ${TABLE}.avg_open_rate ;;
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}.birthday ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: forename {
    type: string
    sql: ${TABLE}.forename ;;
  }

  dimension: ip_opted_in {
    type: string
    sql: ${TABLE}.ip_opted_in ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: member_rating {
    type: number
    sql: ${TABLE}.member_rating ;;
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

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: surname {
    type: string
    sql: ${TABLE}.surname ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
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
    drill_fields: [forename, surname]
  }
}
