view: projects {
  sql_table_name: rittman_analytics.projects ;;
  view_label: "Client Delivery Projects"


  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }









  dimension: client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: code {
    group_label: "Project Details"
    hidden: yes
    type: string
    sql: ${TABLE}.code ;;
  }



  dimension_group: created {
    group_label: "Project Details"

    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }




  filter: is_active {
    group_label: "Project Details"
    label: "Project is Active"
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  filter: is_billable {
    group_label: "Project Details"
    label: "Project is Billable"

    type: yesno
    sql: ${TABLE}.is_billable ;;
  }

  filter: is_fixed_fee {
    group_label: "Project Details"
    label: "Project is Fixed-Price"
    type: yesno
    default_value: "no"
    sql: ${TABLE}.is_fixed_fee ;;
  }

  dimension: name {
    label: "Client Project Name"
    group_label: "Project Details"
    link: {
      label: "View Project in Harvest"
      url: "https://rittman.harvestapp.com/projects/{{ projects.id._value }}"
      icon_url: "http://rittman.harvestapp.com/favicon.ico"
   }
    type: string
    sql: ${TABLE}.name ;;
  }



  dimension: starts_on {
    group_label: "Project Details"

    type: string
    sql: ${TABLE}.starts_on ;;
  }

  dimension_group: updated {
    type: time
    hidden: yes
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count_projects {
    group_label: "Project Details"

    type: count_distinct
    sql: ${id} ;;

  }

  # ----- Sets of fields for drilling ------

}
