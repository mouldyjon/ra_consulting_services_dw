view: deals {
  sql_table_name: ra_data_warehouse.deals ;;

  dimension: deal_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.deal_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_in_home_currency {
    type: number
    sql: ${TABLE}.amount_in_home_currency ;;
  }

  dimension: hubspot_company_id {
    type: number
    sql: ${TABLE}.associatedcompanyids ;;
  }

  dimension: closed_lost_reason {
    type: string
    sql: ${TABLE}.closed_lost_reason ;;
  }

  dimension_group: closedate {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.closedate ;;
  }

  dimension_group: createdate {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdate ;;
  }

  dimension: dealname {
    type: string
    sql: ${TABLE}.dealname ;;
  }

  dimension: dealstage {
    type: string
    sql: ${TABLE}.dealstage ;;
  }

  dimension: dealtype {
    type: string
    sql: ${TABLE}.dealtype ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }



  dimension: hubspot_owner_id {
    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }



  dimension_group: notes_last_contacted {
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
    sql: ${TABLE}.notes_last_contacted ;;
  }

  dimension_group: notes_last_updated {
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
    sql: ${TABLE}.notes_last_updated ;;
  }

  dimension: num_notes {
    type: number
    sql: ${TABLE}.num_notes ;;
  }

  dimension: pipeline {
    type: string
    sql: ${TABLE}.pipeline ;;
  }

  dimension_group: sales_email_last_replied {
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
    sql: ${TABLE}.sales_email_last_replied ;;
  }

  measure: count {
    type: count
    drill_fields: [deal_id, dealname]
  }
}
