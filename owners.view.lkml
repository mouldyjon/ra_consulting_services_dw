view: owners {
  sql_table_name: stitch_hubspot.owners ;;
  view_label: "Sales Opportunities"




  dimension: email {
    type: string
    hidden: yes
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    hidden: yes
    sql: ${TABLE}.firstname ;;
  }

  dimension: salesperson {
    type: string
    sql: concat(concat(${firstname},''),${lastname}) ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: ownerid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.ownerid ;;
  }

  dimension: portalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.portalid ;;
  }

  dimension: remotelist {
    hidden: yes
    sql: ${TABLE}.remotelist ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}.updatedat ;;
  }

  measure: count {
    type: count
  }

  # ----- Sets of fields for drilling ------


}
