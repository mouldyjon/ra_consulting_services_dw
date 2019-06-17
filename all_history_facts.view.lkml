view: all_history_facts {
  view_label: "Looker Usage"
  sql_table_name: client_looker_usage_stats.all_history_facts ;;

  dimension_group: first_query_created {
    type: time
    group_label: "Query Facts"

    timeframes: [
      week,
      month
    ]
    sql: ${TABLE}.first_query_created_time ;;
  }



  dimension: pk {
    hidden: yes
    type: string
    sql: ${TABLE}.pk ;;
  }

  dimension: query_seq_num {
    group_label: "Query Facts"
    type: number
    sql: ${TABLE}.query_seq_num ;;
  }



  dimension: weeks_since_first_query_created_time {
    label: "Weeks Since First Query"
    group_label: "Query Facts"

    type: number
    sql: ${TABLE}.weeks_since_first_query_created_time ;;
  }


}
