view: dev_projects {
  sql_table_name: ra_data_warehouse_dbt_prod.dev_projects ;;

  dimension: id {
    primary_key: yes
    hidden: yes

    type: string
    sql: ${TABLE}.id ;;
  }



  dimension: active {
    label: "Project Active"
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: description {
    label: "Project Description"
    type: string
    sql: ${TABLE}.description ;;
  }




  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }




}
