view: usage_stats {
  derived_table: {
    sql: SELECT * FROM `ra-development.fivetran_looker_usage_stats.usage_stats`
      ;;
  }

  measure: count {
    type: count

  }



  dimension: looker_usage_mins {
    type: number
    sql: ${TABLE}.approximate_web_usage_in_minutes ;;
  }

  measure: total_looker_usage_mins {
    type: sum
    sql: ${TABLE}.approximate_web_usage_in_minutes ;;
  }



  dimension: average_runtime_in_seconds {
    type: number
    sql: ${TABLE}.average_runtime_in_seconds ;;
  }

  measure: total_runtime_in_seconds {
    type: sum
    sql: ${TABLE}.average_runtime_in_seconds ;;
  }



  dimension_group: created_time {
    type: time
    timeframes: [date]
    sql: ${TABLE}.created_time ;;
  }

  dimension: dialect {
    type: string
    sql: ${TABLE}.dialect ;;
  }

  dimension: explore {
    type: string
    sql: ${TABLE}.explore ;;
  }



  dimension: issuer_source {
    type: string
    sql: ${TABLE}.issuer_source ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pk {
    hidden: no
    primary_key: yes
    type: string
    sql: ${TABLE}.pk ;;
  }

  dimension: client {
    type: string
    sql: case when split(${TABLE}.pk,'-')[OFFSET(1)] = 'bi' then 'qubit-bi' else split(${TABLE}.pk,'-')[OFFSET(0)] end ;;
  }

  dimension: rebuild_pdts_yes_no_ {
    type: string
    sql: ${TABLE}.rebuild_pdts_yes_no_ ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }


}
