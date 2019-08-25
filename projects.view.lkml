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




  dimension: project_active {
    group_label: "Project Details"
    label: "Project is Active"
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: budget_by {
    group_label: "Project Commercials"
    label: "Budget By"
    type: string
    sql: ${TABLE}.budget_by ;;
  }

  dimension: budget {
    group_label: "Project Commercials"
    label: "Budget Amount"
    type: number
    sql: ${TABLE}.budget_by ;;
  }

  dimension: cost_budget {
    group_label: "Project Commercials"
    label: "Cost Budget"
    type: number
    sql: ${TABLE}.budget_by ;;
  }

  dimension: project_billable {
    group_label: "Project Commercials"
    label: "Project is Billable"

    type: yesno
    sql: ${TABLE}.is_billable ;;
  }

  dimension: cost_budget_includes_expenses {
    group_label: "Project Commercials"
    label: "Cost Budget Includes Expenses"

    type: yesno
    sql: ${TABLE}.cost_budget_includes_expenses ;;
  }

  dimension: notify_when_over_budget {
    group_label: "Project Commercials"
    label: "Notify When Over Budget"

    type: yesno
    sql: ${TABLE}.cost_budget_includes_expenses ;;
  }

  dimension: project_fixed_fee {
    group_label: "Project Commercials"
    label: "Project is Fixed-Price"
    type: yesno
    sql: ${TABLE}.is_fixed_fee ;;
  }

  dimension: name {
    label: "Project Name"
    group_label: "Project Details"
    link: {
      label: "View Project in Harvest"
      url: "https://rittman.harvestapp.com/projects/{{ projects.id._value }}"
      icon_url: "http://rittman.harvestapp.com/favicon.ico"
   }
    action: {
      label: "Refresh using Stitch and dbt"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obnpjv0/"
      icon_url: "https://www.google.com/s2/favicons?domain=stitchdata.com"
    }
    type: string
    sql: ${TABLE}.name ;;
  }



  dimension: starts_on {
    group_label: "Project Details"

    type: string
    sql: ${TABLE}.starts_on ;;
  }
  dimension: ends_on {
    group_label: "Project Details"

    type: string
    sql: ${TABLE}.ends_on ;;
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
    action: {
      label: "Refresh using Stitch and dbt"
      url: "https://hooks.zapier.com/hooks/catch/3347385/obnpjv0/"
      icon_url: "https://www.google.com/s2/favicons?domain=stitchdata.com"
    }

  }

  # ----- Sets of fields for drilling ------

}
