view: rebtel_looker_usage {
  sql_table_name: looker_usage_tracking.rebtel_looker_usage ;;

  dimension: history_approximate_web_usage_in_minutes {
    type: number
    sql: ${TABLE}.History_Approximate_Web_Usage_in_Minutes ;;
  }

  dimension: history_average_runtime_in_seconds {
    type: number
    sql: ${TABLE}.History_Average_Runtime_in_Seconds ;;
  }

  dimension: history_cache__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Cache__Yes___No_ ;;
  }

  dimension: history_cache_key {
    type: string
    sql: ${TABLE}.History_Cache_Key ;;
  }

  dimension: history_cache_only__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Cache_Only__Yes___No_ ;;
  }

  dimension: history_completed_date {
    type: string
    sql: ${TABLE}.History_Completed_Date ;;
  }

  dimension: history_completed_month {
    type: string
    sql: ${TABLE}.History_Completed_Month ;;
  }

  dimension: history_completed_time {
    type: string
    sql: ${TABLE}.History_Completed_Time ;;
  }

  dimension: history_completed_week {
    type: string
    sql: ${TABLE}.History_Completed_Week ;;
  }

  dimension: history_connection_id {
    type: string
    sql: ${TABLE}.History_Connection_ID ;;
  }

  dimension: history_connection_name {
    type: string
    sql: ${TABLE}.History_Connection_Name ;;
  }

  dimension: history_count {
    type: number
    sql: ${TABLE}.History_Count ;;
  }

  dimension_group: history_created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.History_Created_Date ;;
  }






  dimension: history_dashboard_session {
    type: string
    sql: ${TABLE}.History_Dashboard_Session ;;
  }

  dimension: history_dashboard_user {
    type: number
    sql: ${TABLE}.History_Dashboard_User ;;
  }

  dimension: history_dialect {
    type: string
    sql: ${TABLE}.History_Dialect ;;
  }

  dimension: history_explore_user {
    type: number
    sql: ${TABLE}.History_Explore_User ;;
  }

  dimension_group: history_first_query {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.History_First_Query_Date ;;
  }

  dimension: history_force_production__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Force_Production__Yes___No_ ;;
  }

  dimension: history_generate_links__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Generate_Links__Yes___No_ ;;
  }

  dimension: history_id {
    type: number
    sql: ${TABLE}.History_ID ;;
  }

  dimension: history_is_single_query__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Is_Single_Query__Yes___No_ ;;
  }

  dimension: history_is_user_dashboard__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Is_User_Dashboard__Yes___No_ ;;
  }

  dimension: history_issuer_source {
    type: string
    sql: ${TABLE}.History_Issuer_Source ;;
  }

  dimension: history_max_runtime_in_seconds {
    type: number
    sql: ${TABLE}.History_Max_Runtime_in_Seconds ;;
  }

  dimension: history_message {
    type: string
    sql: ${TABLE}.History_Message ;;
  }

  dimension: history_min_runtime_in_seconds {
    type: number
    sql: ${TABLE}.History_Min_Runtime_in_Seconds ;;
  }

  dimension_group: history_most_recent_query {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.History_Most_Recent_Query_Date ;;
  }

  dimension_group: history_most_recent_query_run_at {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.History_Most_Recent_Query_Run_at_Date ;;
  }

  dimension: history_most_recent_run_length_in_seconds {
    type: number
    sql: ${TABLE}.History_Most_Recent_Run_Length_in_Seconds ;;
  }

  dimension: history_queries_under_10s {
    type: number
    sql: ${TABLE}.History_Queries_Under_10s ;;
  }

  dimension: history_query_run_count {
    type: number
    sql: ${TABLE}.History_Query_Run_Count ;;
  }

  dimension: history_rebuild_pdts__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Rebuild_PDTs__Yes___No_ ;;
  }

  dimension: history_render_key {
    type: string
    sql: ${TABLE}.History_Render_Key ;;
  }

  dimension: history_result_format {
    type: string
    sql: ${TABLE}.History_Result_Format ;;
  }

  dimension: history_result_source {
    type: string
    sql: ${TABLE}.History_Result_Source ;;
  }

  dimension: history_results_from_cache {
    type: number
    sql: ${TABLE}.History_Results_from_Cache ;;
  }

  dimension: history_results_from_database {
    type: number
    sql: ${TABLE}.History_Results_from_Database ;;
  }

  dimension: history_results_from_stale_cache {
    type: number
    sql: ${TABLE}.History_Results_from_Stale_Cache ;;
  }

  dimension: history_runtime_in_seconds {
    type: number
    sql: ${TABLE}.History_Runtime_in_Seconds ;;
  }

  dimension: history_runtime_tiers_in_1_second_increments {
    type: string
    sql: ${TABLE}.History_Runtime_Tiers_in_1_Second_Increments ;;
  }

  dimension: history_runtime_tiers_in_5_second_increments {
    type: string
    sql: ${TABLE}.History_Runtime_Tiers_in_5_Second_Increments ;;
  }

  dimension: history_runtime_tiers_in_seconds {
    type: string
    sql: ${TABLE}.History_Runtime_Tiers_in_Seconds ;;
  }

  dimension: history_server_table_calcs__yes___no_ {
    type: yesno
    sql: ${TABLE}.History_Server_Table_Calcs__Yes___No_ ;;
  }

  dimension: history_slug {
    type: string
    sql: ${TABLE}.History_Slug ;;
  }

  dimension: history_source {
    type: string
    sql: ${TABLE}.History_Source ;;
  }

  dimension: history_sql_runner_user {
    type: number
    sql: ${TABLE}.History_SQL_Runner_User ;;
  }

  dimension: history_status {
    type: string
    sql: ${TABLE}.History_Status ;;
  }

  dimension: history_total_runtime_in_seconds {
    hidden: yes
    type: number
    sql: ${TABLE}.History_Total_Runtime_in_Seconds ;;
  }

  measure: total_history_total_runtime_in_seconds {
    label: "Total Runtime in Seconds"
    type: sum
    sql: ${history_average_runtime_in_seconds} ;;
  }

  dimension: history_workspace_id {
    type: string
    sql: ${TABLE}.History_Workspace_ID ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.User_Email ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.User_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [history_connection_name, user_name]
  }
}