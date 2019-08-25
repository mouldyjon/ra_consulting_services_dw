view: dev_epics {
  sql_table_name: ra_data_warehouse_dbt_prod.dev_epics ;;
  view_label: "Jira Projects"
  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: _sdc_sequence {
    type: number
    hidden: yes

    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: active {
    group_label: "Jira Issues"
    label: "Issue Active"
    hidden: yes
    type: yesno
    sql: ${TABLE}.active ;;
  }

  measure: aggregate_progress {
    hidden: yes

    type: average
    sql: ${TABLE}.aggregate_progress ;;
  }

  dimension: colourname {
    label: "Issue Status Colour"
    group_label: "Jira Issues"

    type: string
    sql: ${TABLE}.colourname ;;
  }

  dimension_group: created {
    group_label: "Jira Issues"

    label: "Issue"
    type: time
    timeframes: [
      raw,
      date
    ]
    sql: ${TABLE}.created ;;
  }

  dimension_group: updated {
    group_label: "Jira Issues"

    label: "Issue"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated ;;
  }

  dimension: description {
    group_label: "Jira Issues"

    label: "Issue Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: displayname {
    group_label: "Jira Issues"

    label: "Requestor"
    type: string
    sql: ${TABLE}.displayname ;;
  }



  dimension: issuetype_description {
    group_label: "Jira Issues"

    type: string
    sql: ${TABLE}.issuetype_description ;;
  }

  dimension: issuetype_name {
    group_label: "Jira Issues"

    label: "Issue Type"
    type: string
    sql: ${TABLE}.issuetype_name ;;
  }

  dimension: estimated_hours {
    group_label: "Jira Issues"
    label: "Estimated Hours to Complete"
    type: number
    sql: ${TABLE}.estimated_hours ;;
  }

  dimension: remaining_hours_to_complete {
    group_label: "Jira Issues"
    label: "Remaining Hours to Complete"
    type: number
    sql: ${TABLE}.estimated_hours ;;
  }

  measure: total_estimated_hours {
    group_label: "Jira Issues"
    label: "Total Estimated Hours to Complete"
    type: sum
    sql: ${estimated_hours} ;;
  }

  measure: total_remaining_hours_to_complete {
    group_label: "Jira Issues"
    label: "Total Remaining Hours to Complete"
    type: sum
    sql: ${remaining_hours_to_complete} ;;
  }

  dimension: key {
    hidden: yes
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension_group: lastviewed {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastviewed ;;
  }



  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: priority_name {
    group_label: "Jira Issues"

    label: "Issue Priority"
    type: string
    sql: ${TABLE}.priority_name ;;
  }

  measure: progress {
    hidden: yes
    type: average
    sql: ${TABLE}.progress ;;
  }

  dimension: project_id {
    hidden: yes

    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_key {
    hidden: yes

    type: string
    sql: ${TABLE}.project_key ;;
  }

  dimension: projecttypekey {
    hidden: yes

    type: string
    sql: ${TABLE}.projecttypekey ;;
  }

  dimension: statuscategory {
    group_label: "Jira Issues"

    label: "Issue Status"
    type: string
    sql: ${TABLE}.statuscategory ;;
  }

  dimension: subtask {
    group_label: "Jira Issues"
    label: "Subtask"
    type: yesno
    sql: ${TABLE}.subtask ;;
  }

  dimension: summary {
    group_label: "Jira Issues"

    type: string
    sql: ${TABLE}.summary ;;
  }

  measure: total {
    hidden: yes

    type: average
    sql: ${TABLE}.total ;;
  }

  measure: total_progress {
    group_label: "Jira Issues"

    type: average
    sql: ${TABLE}.total_progress ;;
  }

  measure: count {
    group_label: "Jira Issues"
    label: "Count of Issues"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      colourname,
      priority_name,
      issuetype_name,
      displayname,
      name
    ]
  }
}
