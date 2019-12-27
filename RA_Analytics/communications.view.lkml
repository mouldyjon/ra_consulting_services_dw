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
    group_label: "Message Details"

    label: "Message"
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}.communication_timestamp ;;
  }

  dimension: communication_type {
    label: "Message Type"
    group_label: "Message Details"
    type: string
    sql: ${TABLE}.communication_type ;;
  }

  dimension: communications_cc_email {
    group_label: "Message Contents"
    label: "Message cc"
    type: string
    sql: ${TABLE}.communications_cc_email ;;
  }

  dimension: communications_from_firstname_lastname {
    group_label: "Message Contents"
    label: "Message From"
    type: string
    sql: ${TABLE}.communications_from_firstname_lastname ;;
  }

  dimension: communications_status {
    group_label: "Message Details"
    label: "Message Status"
    type: string
    sql: ${TABLE}.communications_status ;;
  }

  dimension: communications_subject {
    group_label: "Message Contents"
    label: "Message Subject"
    type: string
    sql: ${TABLE}.communications_subject ;;
  }

  dimension: communications_text {
    group_label: "Message Contents"
    label: "Message Body"
    type: string
    sql: ${TABLE}.communications_text ;;
  }

  dimension: communications_to_email {
    group_label: "Message Contents"
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
    group_label: "Message Contents"
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

    type: count_distinct
    sql: case when ${communication_type} = 'EMAIL' then ${communications_id} end  ;;
  }

  measure: count_incoming_emails {
    type: count_distinct
    sql: case when ${communication_type} = 'INCOMING_EMAIL' then ${communications_id} end  ;;
  }


}
