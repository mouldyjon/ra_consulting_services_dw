view: bridge {
  sql_table_name: bridge_associatedcompanyids ;;

  dimension: associatedcompanyids {
    type: number
    hidden: yes
    sql: ${TABLE}.associatedcompanyids ;;
  }

  dimension: deal_id {
    type: number
    hidden: yes
    sql: ${TABLE}.deal_id ;;
  }
}
