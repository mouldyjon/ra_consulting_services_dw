view: dev_stories {
  sql_table_name: ra_data_warehouse_dbt_prod.dev_stories ;;

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
    label: "Issue Active"
    type: yesno
    sql: ${TABLE}.active ;;
  }

  measure: aggregate_progress {
    type: average
    sql: ${TABLE}.aggregate_progress ;;
  }

  dimension: colourname {
    label: "RAG Status"
    type: string
    sql: ${TABLE}.colourname ;;
  }

  dimension_group: created {
    label: "Issue"
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
    sql: ${TABLE}.created ;;
  }

  dimension_group: updated {
    label: "Issue"
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.updated ;;
  }

  dimension: description {
    label: "Issue Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: displayname {
    label: "Requestor"
    type: string
    sql: ${TABLE}.displayname ;;
  }



  dimension: issuetype_description {
    type: string
    sql: ${TABLE}.issuetype_description ;;
  }

  dimension: issuetype_name {
    label: "Issue Type"
    type: string
    sql: ${TABLE}.issuetype_name ;;
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
    label: "Issue Status"
    type: string
    sql: ${TABLE}.statuscategory ;;
  }

  dimension: subtask {
    type: yesno
    sql: ${TABLE}.subtask ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  measure: total {
    hidden: yes

    type: average
    sql: ${TABLE}.total ;;
  }

  measure: total_progress {
    type: average
    sql: ${TABLE}.total_progress ;;
  }

  measure: count {
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
