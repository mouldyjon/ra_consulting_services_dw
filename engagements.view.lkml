view: engagements {
  sql_table_name: stitch_hubspot.engagements ;;

  dimension: engagement_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.engagement_id ;;
  }


  dimension: associations {
    hidden: yes
    sql: ${TABLE}.associations ;;
  }

  dimension: attachments {
    hidden: yes
    sql: ${TABLE}.attachments ;;
  }

  dimension: engagement {
    hidden: yes
    sql: ${TABLE}.engagement ;;
  }

  dimension: lastupdated {
    type: string
    sql: ${TABLE}.lastupdated ;;
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata ;;
  }

  measure: count {
    type: count
    drill_fields: [engagement_id]
  }
}

view: engagements__associations {
  dimension: companyids {
    type: number
    sql: ${TABLE}.companyids ;;
  }

  dimension: contactids {
    type: number
    sql: ${TABLE}.contactids ;;
  }

  dimension: dealids {
    type: number
    sql: ${TABLE}.dealids ;;
  }
}

view: engagements__metadata__cc {
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
}

view: engagements__metadata {
  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: cc {
    hidden: yes
    sql: ${TABLE}.cc ;;
  }

  dimension: from {
    hidden: yes
    sql: ${TABLE}.``from`` ;;
  }

  dimension: html {
    type: string
    sql: ${TABLE}.html ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: to {
    hidden: yes
    sql: ${TABLE}.``to`` ;;
  }
}

view: engagements__metadata__from {
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }
}

view: engagements__metadata__to {
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
}

view: engagements__engagement {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension_group: createdat {
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
    sql: ${TABLE}.createdat ;;
  }

  dimension_group: lastupdated {
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
    sql: ${TABLE}.lastupdated ;;
  }

  dimension: ownerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.ownerid ;;
  }

  dimension: portalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.portalid ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: engagements__attachments {
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
}
