view: pageviews_sessionized {
  derived_table: {
    sql: SELECT * FROM `ra-development.analytics.pages_sessionized`
      ;;
  }

  measure: count {
    label: "Sessions"
    type: count
  }



  dimension_group: session_start_ts {
    type: time
    timeframes: [raw,date,week,week_of_year,month,day_of_week,day_of_month,quarter,year]
    sql: ${TABLE}.session_start_ts ;;
  }

  dimension: secs_between_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.secs_between_sessions ;;
  }

  measure: avg_secs_between_sessions {
    type: average
    sql: ${TABLE}.secs_between_sessions ;;
  }

  dimension: anonymous_id {
    hidden: yes

    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: global_session_id {
    type: number
    sql: ${TABLE}.global_session_id ;;
  }

  dimension: user_session_id {
    type: number
    sql: ${TABLE}.user_session_id ;;
  }

  dimension: page_views_in_session {
    type: number
    hidden: yes

    sql: ${TABLE}.page_views_in_session ;;
  }

  measure: avg_page_views_in_session {
    type: average
    hidden: no

    sql: ${TABLE}.page_views_in_session ;;
  }

  dimension: ra_blog_page_views_in_session {
    type: number
    hidden: yes
    sql: ${TABLE}.ra_blog_page_views_in_session ;;
  }

  measure: avg_ra_page_views_in_session {
    type: average
    hidden: no

    sql: ${TABLE}.ra_page_views_in_session ;;
  }

  measure: total_ra_page_views_in_session {
    type: sum
    hidden: no

    sql: ${TABLE}.ra_page_views_in_session ;;
  }

  dimension: ra_commercial_page_views_in_session {
    type: number
    hidden: yes
    sql: ${TABLE}.ra_commercial_page_views_in_session ;;
  }

  measure: avg_ra_commercial_page_views_in_session {
    type: average
    hidden: no

    sql: ${TABLE}.ra_commercial_page_views_in_session ;;
  }

  measure: total_ra_commercial_page_views_in_session {
    type: sum
    hidden: no

    sql: ${TABLE}.ra_commercial_page_views_in_session ;;
  }


  dimension: dtd_page_views_in_session {
    type: number
    hidden: yes
    sql: ${TABLE}.dtd_page_views_in_session ;;
  }

  measure: avg_dtd_page_views_in_session {
    type: average
    hidden: no

    sql: ${TABLE}.dtd_page_views_in_session ;;
  }

  measure: total_dtd_page_views_in_session {
    type: sum
    hidden: no

    sql: ${TABLE}.dtd_page_views_in_session ;;
  }

  dimension: session_visitor_type {
    type: string
    sql: ${TABLE}.session_visitor_type ;;
  }

  dimension: bounced_sessions {
    type: number
    sql: ${TABLE}.bounced_sessions ;;
  }

  measure: avg_bounced_sessions {
    type: average
    sql: ${TABLE}.bounced_sessions ;;
  }

  measure: total_bounced_sessions {
    type: sum
    sql: ${TABLE}.bounced_sessions ;;
  }

  dimension: session_length_ts {
    type: number
    sql: ${TABLE}.session_length_ts ;;
  }

  measure: avg_length_ts {
    type: average
    sql: ${TABLE}.session_length_ts ;;
  }

  dimension: entrance_url {
    type: string
    sql: ${TABLE}.entrance_url ;;
  }

  dimension: campaign_source {
    type: string
    sql: ${TABLE}.entrance_campaign_source ;;
  }

  dimension: campaign_content {
    type: string
    sql: ${TABLE}.entrance_campaign_content ;;
  }

  dimension: campaign_medium {
    type: string
    sql: ${TABLE}.entrance_campaign_medium ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.entrance_campaign_name ;;
  }

  dimension: campaign_term {
    type: string
    sql: ${TABLE}.entrance_campaign_term ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.entrance_referrer ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.entrance_search ;;
  }


}
