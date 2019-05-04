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
group_label: "Opportunity Details"
    type: string
    sql: concat(concat(${firstname},''),${lastname}) ;;
  }

  dimension: lastname {
    hidden: yes

    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: ownerid {
    type: number
    hidden: yes

    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.ownerid ;;
  }

  dimension: portalid {
    hidden: yes

    type: number
    value_format_name: id
    sql: ${TABLE}.portalid ;;
  }

  dimension: remotelist {
    hidden: yes
    sql: ${TABLE}.remotelist ;;
  }

  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updatedat {
    hidden: yes

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
