view: all_history {
  view_label: "Looker Usage"
  sql_table_name: client_looker_usage_stats.all_history ;;








  dimension: dashboard_title {
    group_label: "Content"
    type: string
    sql: ${TABLE}.Dashboard_Title ;;
  }

  dimension: pk {
    type: string
    primary_key: yes
    sql: ${TABLE}.pk ;;
  }

  dimension: history_approximate_web_usage_in_minutes {
    type: number
    hidden: yes
    sql: ${TABLE}.History_Approximate_Web_Usage_in_Minutes ;;
  }

  measure: total_looker_usage_mins {
    type: sum
    sql: ${history_approximate_web_usage_in_minutes} ;;
  }

  dimension: history_cache__yes___no_ {
    type: yesno
    group_label: "Query"

    label: "Results from Cache"
    sql: ${TABLE}.History_Cache__Yes___No_ ;;
  }

  dimension: history_cache_only__yes___no_ {
    label: "Results from Cache Only"
    group_label: "Query"

    type: yesno
    sql: ${TABLE}.History_Cache_Only__Yes___No_ ;;
  }

  dimension: history_connection_name {
    label: "Database Connection Name"
    group_label: "Query"

    type: string
    sql: ${TABLE}.History_Connection_Name ;;
  }

  dimension: history_count {
    hidden: yes
    type: number
    sql: ${TABLE}.History_Count ;;
  }

  dimension_group: history_created {
    label: "Query"
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
    sql: ${TABLE}.History_Created_Time ;;
  }



  dimension: history_dashboard_session {
    type: string
    hidden: yes
    sql: ${TABLE}.History_Dashboard_Session ;;
  }

  dimension: history_dashboard_user {
    type: number
    hidden: yes
    sql: ${TABLE}.History_Dashboard_User ;;
  }

  measure: total_dashboard_queries {
    type: sum
    sql: ${history_dashboard_user} ;;
  }
  dimension: history_dialect {
    group_label: "Query"

    type: string
    label: "SQL Dialect"
    sql: ${TABLE}.History_Dialect ;;
  }

  dimension: history_explore_user {
    type: number
    hidden: yes

    sql: ${TABLE}.History_Explore_User ;;
  }

  measure: total_explore_user_queries {
    type: sum
    sql: ${history_explore_user} ;;
  }
  dimension: history_id {
    hidden: yes
    type: number
    sql: ${TABLE}.History_ID ;;
  }

  dimension: history_is_single_query__yes___no_ {
    hidden: yes
    type: yesno
    sql: ${TABLE}.History_Is_Single_Query__Yes___No_ ;;
  }

  dimension: history_is_user_dashboard__yes___no_ {
    group_label: "Content"

    label: "User Dashboard"
    type: yesno
    sql: ${TABLE}.History_Is_User_Dashboard__Yes___No_ ;;
  }

  dimension: history_issuer_source {
    group_label: "Query"

    label: "Issuer Source"
    type: string
    sql: ${TABLE}.History_Issuer_Source ;;
  }

  dimension: history_query_run_count {
    hidden: yes
    type: number
    sql: ${TABLE}.History_Query_Run_Count ;;
  }

  measure: total_query_executions {
    type: sum
    sql: ${history_query_run_count} ;;
  }

  dimension: history_rebuild_pdts__yes___no_ {
    label: "Query Triggered PDT Rebuild"
    group_label: "Query"

    type: yesno
    sql: ${TABLE}.History_Rebuild_PDTs__Yes___No_ ;;
  }

  dimension: history_result_format {
    group_label: "Query"

    label: "Results Format"
    type: string
    sql: ${TABLE}.History_Result_Format ;;
  }

  dimension: history_result_source {
    group_label: "Query"

    type: string
    label: "Results Source"
    sql: ${TABLE}.History_Result_Source ;;
  }

  dimension: history_results_from_cache {
    group_label: "Query"

    type: number
    hidden: yes

    sql: ${TABLE}.History_Results_from_Cache ;;
  }

  dimension: history_results_from_database {
    type: number
    hidden: yes

    sql: ${TABLE}.History_Results_from_Database ;;
  }

  dimension: history_results_from_stale_cache {
    type: number
    hidden: yes

    sql: ${TABLE}.History_Results_from_Stale_Cache ;;
  }

  dimension: history_server_table_calcs__yes___no_ {
    group_label: "Query"
    label: "Used Server Table Calcs"
    hidden: no
    type: yesno
    sql: ${TABLE}.History_Server_Table_Calcs__Yes___No_ ;;
  }

  dimension: history_slug {
    hidden: yes
    type: string
    sql: ${TABLE}.History_Slug ;;
  }

  dimension: history_source {
    group_label: "Query"
    label: "Source"
    type: string
    sql: ${TABLE}.History_Source ;;
  }

  dimension: history_status {
    group_label: "Query"
    label: "Status"
    type: string
    sql: ${TABLE}.History_Status ;;
  }

  dimension: history_total_runtime_in_seconds {
    type: number
    hidden: yes
    sql: ${TABLE}.History_Total_Runtime_in_Seconds ;;
  }

   measure: total_query_execution_time_secs {
     type: sum
     sql: ${history_total_runtime_in_seconds} ;;
   }

  measure: avg_query_execution_time_secs {
    type: average
    sql: ${history_total_runtime_in_seconds} ;;
  }

  dimension: site {
    label: "Client"
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: user_count {
    type: number
    hidden: yes
    sql: ${TABLE}.User_Count ;;
  }

  measure: total_users {
    type: sum_distinct
    sql_distinct_key: ${user_email} ;;
    sql: ${user_count} ;;
  }

  dimension_group: user_created {
    label: "User Cohort"
    type: time
    timeframes: [
      week,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.User_Created_Date ;;
  }

  dimension: user_email {
    group_label: "User"
    type: string
    hidden: yes
    sql: ${TABLE}.User_Email ;;
  }

  dimension: user_name {
    group_label: "User"

    type: string
    sql: ${TABLE}.User_Name ;;
  }


}
