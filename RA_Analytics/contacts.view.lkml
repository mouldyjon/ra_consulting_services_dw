view: contacts {
  sql_table_name: contacts ;;
  view_label: "Hubspot Contacts"
  drill_fields: [contactid]

  dimension: contactid {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.contactid ;;
  }

  dimension: associatedcompanyid {
    hidden: yes
    type: number
    sql: ${TABLE}.associatedcompanyid ;;
  }

  dimension: address {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    hidden: yes
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension_group: createdate {
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
    sql: ${TABLE}.createdate ;;
  }

  dimension: email {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: hubspot_owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.hubspot_owner_id ;;
  }

  dimension: hubspot_team_id {
    hidden: yes
    type: string
    sql: ${TABLE}.hubspot_team_id ;;
  }

  dimension: is_contact {
    type: yesno
    hidden: yes
    sql: ${TABLE}.is_contact ;;
  }

  dimension: jobtitle {
    type: string
    group_label: "Contact Details"
    label: "Position"
    sql: ${TABLE}.jobtitle ;;
  }

  dimension_group: lastmodifieddate {
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
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension: lastname {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: lifecyclestage {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.lifecyclestage ;;
  }

  dimension: mobilephone {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.mobilephone ;;
  }

  dimension: name {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_associated_deals {
    group_label: "Contact values"
    type: number
    sql: ${TABLE}.num_associated_deals ;;
  }

  dimension: phone {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: recent_deal_amount {
    group_label: "Contact Values"
    type: number
    sql: ${TABLE}.recent_deal_amount ;;
  }

  dimension: state {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: website {
    group_label: "Contact Details"
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: zip {
    group_label: "Contact Details"
    hidden: yes
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    group_label: "Contact Values"
    label: "Contact Count"
    type: count
    drill_fields: [contactid, firstname, lastname, name]
  }
}
