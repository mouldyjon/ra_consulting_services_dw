view: pageviews {
  sql_table_name: ra_data_warehouse_dbt_dev.pageviews ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  dimension: context_page_search {
    type: string
    sql: ${TABLE}.context_page_search ;;
  }

  dimension: context_page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
  }

  dimension: context_page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
  }

  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: site_visitor_customer_id {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: network_category {
    type: string
    sql: ${TABLE}.network_category ;;
  }

  dimension: network_type {
    type: string
    sql: ${TABLE}.network_type ;;
  }

  dimension: page_category {
    type: string
    sql: ${TABLE}.page_category ;;
  }

  dimension: page_subcategory {
    type: string
    sql: ${TABLE}.page_subcategory ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }



  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: visitor_category {
    type: string
    sql: ${TABLE}.visitor_category ;;
  }

  dimension: visitor_subcategory {
    type: string
    sql: ${TABLE}.visitor_subcategory ;;
  }

  measure: count {
    type: count
    drill_fields: [id, context_library_name]
  }
}
