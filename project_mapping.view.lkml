view: project_mapping {
  sql_table_name: stitch_jira.project_mapping ;;

  dimension: customer_name {
    type: string
    hidden: yes

    sql: ${TABLE}.customer_name ;;
  }

  dimension: project_name {
    hidden: yes
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }
}
