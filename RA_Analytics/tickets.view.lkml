view: tickets {
  derived_table: {
    sql: SELECT * from `ra-development.ra_data_warehouse_dbt_prod.tickets`
      ;;
  }


  dimension: key {
    hidden: yes
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: id {
    hidden: yes
    primary_key: yes

    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    group_label: "Jira Tickets"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.created ;;
  }

  dimension: displayname {
    group_label: "Jira Tickets"

    label: "Reporter"
    type: string
    sql: ${TABLE}.displayname ;;
  }

  dimension: active {
    group_label: "Jira Tickets"

    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: progress {
    hidden: yes

    type: number
    sql: ${TABLE}.progress ;;
  }




  measure: total {
    group_label: "Jira Tickets"

    type: count
    sql: ${TABLE}.total ;;
  }

  dimension: priority_name {
    group_label: "Jira Tickets"

    label: "Priority"
    type: string
    sql: ${TABLE}.priority_name ;;
  }

  dimension: issuetype_name {
    group_label: "Jira Tickets"

    label: "Ticket Type"
    type: string
    sql: ${TABLE}.issuetype_name ;;
  }

  dimension: description {
    group_label: "Jira Tickets"

    label: "Ticket Description"
    type: string
    sql: ${TABLE}.description ;;
  }



  dimension: statuscategory {
    group_label: "Jira Tickets"

    label: "Ticket Status Category"
    type: string
    sql: ${TABLE}.statuscategory ;;
  }

  dimension: projecttypekey {
    hidden: yes

    type: string
    sql: ${TABLE}.projecttypekey ;;
  }

  dimension: project_id {
    hidden: yes

    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: name {
    group_label: "Jira Tickets"

    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: project_key {
    hidden: yes

    type: string
    sql: ${TABLE}.project_key ;;
  }

  dimension: parent_key {
    hidden: yes

    type: string
    sql: ${TABLE}.parent_key ;;
  }

  dimension: summary {
    group_label: "Jira Tickets"

    type: string
    sql: ${TABLE}.summary ;;
  }



  dimension_group: status_change_ts {
    group_label: "Jira Tickets"

    type: time
    sql: ${TABLE}.status_change_ts ;;
  }

  measure: count_completed {

    group_label: "Ticket Categorisation"
    type: sum
    sql: ${TABLE}.count_completed ;;
  }

  measure: count_in_progress {
    group_label: "Ticket Categorisation"

    type: sum
    sql: ${TABLE}.count_in_progress ;;
  }

  measure: count_unassigned {
    group_label: "Ticket Categorisation"

    type: sum
    sql: ${TABLE}.count_unassigned ;;
  }

  measure: count_tasks {
    group_label: "Ticket Categorisation"

    type: sum
    sql: ${TABLE}.count_tasks ;;
  }

  measure: count_subtasks {
    group_label: "Ticket Categorisation"

    type: sum
    sql: ${TABLE}.count_subtasks ;;
  }

  measure: count_bugs {
    group_label: "Ticket Categorisation"

    type: sum
    sql: ${TABLE}.count_bugs ;;
  }

  measure: count_support_tickets {
    group_label: "Ticket Categorisation"

    type: sum
    sql: ${TABLE}.count_support_tickets ;;
  }

  dimension: service_category {
    group_label: "Jira Tickets"

    type: string
    sql: ${TABLE}.service_category ;;
  }

  dimension: project_grouping {
    hidden: no
    type: string
    sql: ${TABLE}.project_grouping ;;
  }

  dimension: issue_completed {
    group_label: "Jira Tickets"
    label: "Ticket Completed"
    type: yesno
    sql: ${TABLE}.issue_completed ;;
  }

  measure: total_hours_to_complete {
    group_label: "Ticket Metrics"

    type: sum
    sql: ${TABLE}.issue_hours_to_complete ;;
  }

  measure: avg_hours_to_complete {
    group_label: "Ticket Metrics"

    type: average
    sql: ${TABLE}.issue_hours_to_complete ;;
  }



  dimension: customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: project_name {
    group_label: "Jira Projects"

    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: project_type {
    group_label: "Jira Projects"

    type: string
    sql: ${TABLE}.project_type ;;
  }

  dimension: project_description {
    group_label: "Jira Projects"

    type: string
    sql: ${TABLE}.project_description ;;
  }

  set: detail {
    fields: [
      key,
      id,
      created_time,
      displayname,
      active,
      progress,
      total_progress,
      aggregate_progress,
      estimated_hours,
      remaining_hours_to_complete,
      total,
      priority_name,
      issuetype_name,
      description,
      colourname,
      statuscategory,
      projecttypekey,
      project_id,
      name,
      project_key,
      parent_key,
      summary,
      lastviewed_time,
      updated_time,
      status_change_ts_time,
      count_completed,
      count_in_progress,
      count_unassigned,
      count_tasks,
      count_subtasks,
      count_bugs,
      count_support_tickets,
      service_category,
      project_grouping,
      issue_completed,
      project_name,
      project_type,
      project_description
    ]
  }
}
