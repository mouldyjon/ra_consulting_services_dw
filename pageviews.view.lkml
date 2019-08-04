view: pageviews {
  derived_table: {
    sql: SELECT * FROM `ra-development.ra_data_warehouse_dbt_prod.pageviews`
      ;;
  }

  measure: pageview_count {
    type: count_distinct
    sql: ${pk} ;;
    drill_fields: [detail*]
  }

  dimension: customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: event_ts {
    type: time
    timeframes: [raw,time,date,day_of_week,day_of_year,week,week_of_year,month,month_name,month_num,quarter,quarter_of_year,year]
    sql: ${TABLE}.event_ts ;;
  }

  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: concat(concat(${page_title},cast(${event_ts_raw} as string)),${visitor_domain}) ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: visitor_city {
    type: string
    sql: ${TABLE}.visitor_city ;;
  }

  dimension: visitor_domain {
    type: string
    sql: ${TABLE}.visitor_domain ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_url {
    label: "Referring URL"
    type: string
    sql: ${TABLE}.page_url ;;
  }

  set: detail {
    fields: [
      customer_id,
      event_ts_time,
      site,
      visitor_city,
      visitor_domain,
      page_title,
      page_url
    ]
  }
}
