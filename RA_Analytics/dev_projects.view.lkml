view: dev_projects {
  sql_table_name: ra_data_warehouse_dbt_prod.dev_projects ;;

  dimension: id {
    primary_key: yes
    hidden: yes

    type: string
    sql: ${TABLE}.id ;;
  }



  dimension: active {
    group_label: "Jira Projects"
    label: "Jira Project Active"
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: description {
    group_label: "Jira Projects"

    label: "Jira Project Description"
    type: string
    sql: ${TABLE}.description ;;
  }




  dimension: name {
    group_label: "Jira Projects"
    label: "Jira Project Name"
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Refresh using Stitch and dbt"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obnns7r/"
      icon_url: "https://www.google.com/s2/favicons?domain=stitchdata.com"
    }
  }




}
