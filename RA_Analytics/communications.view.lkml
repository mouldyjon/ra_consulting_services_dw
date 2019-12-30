view: communications {
  sql_table_name: communications ;;

  dimension: communication_ownerid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.communication_ownerid ;;
  }

  dimension: communications_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.communications_id ;;
  }

  dimension_group: communication_timestamp {
    type: time
    group_label: "Sales Engagements"

    label: "Message"
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}.communication_timestamp ;;
  }

  dimension: communication_type {
    label: "Message Type"
    group_label: "Sales Engagements"
    type: string
    sql: ${TABLE}.communication_type ;;
  }

  dimension: communications_cc_email {
    group_label: "Sales Engagements"
    label: "Message cc"
    type: string
    sql: ${TABLE}.communications_cc_email ;;
  }

  dimension: communications_from_firstname_lastname {
    group_label: "Sales Engagements"
    label: "Message From"
    type: string
    sql: ${TABLE}.communications_from_firstname_lastname ;;
  }

  dimension: communications_status {
    group_label: "Sales Engagements"
    label: "Message Status"
    type: string
    sql: ${TABLE}.communications_status ;;
  }

  dimension: communications_subject {
    group_label: "Sales Engagements"
    label: "Message Subject"
    type: string
    sql: ${TABLE}.communications_subject ;;
  }



  dimension: communications_to_email {
    group_label: "Sales Engagements"
    label: "Message To Email"
    type: string
    sql: ${TABLE}.communications_to_email ;;
  }

  dimension: hubspot_company_id {
    hidden: yes
    type: number
    sql: ${TABLE}.hubspot_company_id ;;
  }

  dimension: owner_full_name {
    group_label: "Sales Engagements"
    label: "Message Owner Name"
    type: string
    sql: ${TABLE}.owner_full_name ;;
  }

  dimension: sales_opportunity_id {
    type: number
    hidden: yes
    sql: ${TABLE}.sales_opportunity_id ;;
  }

  measure: count_outgoing_emails {
    group_label: "Sales Engagement Counts"

    type: count_distinct
    sql: case when ${communication_type} = 'EMAIL' then ${communications_id} end  ;;
  }

  measure: count_meetings {
    group_label: "Sales Engagement Counts"

    type: count_distinct
    sql: case when ${communication_type} = 'MEETING' then ${communications_id} end  ;;
  }

  measure: count_calls {
    group_label: "Sales Engagement Counts"

    type: count_distinct
    sql: case when ${communication_type} = 'CALL' then ${communications_id} end  ;;
  }

  measure: count_notes {
    group_label: "Sales Engagement Counts"

    type: count_distinct
    sql: case when ${communication_type} = 'NOTE' then ${communications_id} end  ;;
  }

  measure: count_incoming_emails {
    group_label: "Sales Engagement Counts"

    type: count_distinct
    sql: case when ${communication_type} = 'INCOMING_EMAIL' then ${communications_id} end  ;;
  }


}
