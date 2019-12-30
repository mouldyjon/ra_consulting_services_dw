view: contacts {
  sql_table_name: contacts ;;
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
    label: "Contact Address"
    group_item_label: "Address"
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    group_label: "Contact Details"

    label: "Contact City"
    group_item_label: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    group_label: "Contact Details"

    label: "Contact Company Name"
    group_item_label: "Company Name"
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
    label: "Contact Email"
    group_item_label: "Email"
    type: string
    sql: ${TABLE}.email ;;
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
    label: "Contact Job Title"
    group_item_label: "Title"
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



  dimension: lifecyclestage {
    group_label: "Contact Details"
    hidden: yes
    type: string
    sql: ${TABLE}.lifecyclestage ;;
  }

  dimension: mobilephone {
    group_label: "Contact Details"
    label: "Mobile Number"
    type: string
    sql: ${TABLE}.mobilephone ;;
  }

  dimension: name {
    group_label: "Contact Details"
    label: "Contact Name"
    group_item_label: "Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_associated_deals {
    group_label: "Contact Details"
    label: "Number of Associated Deals"
    type: number
    sql: ${TABLE}.num_associated_deals ;;
  }

  dimension: phone {
    group_label: "Contact Details"
    label: "Phone Number"
    type: string
    sql: ${TABLE}.phone ;;
  }



  dimension: state {
    group_label: "Contact Details"
    label: "Contact State"
    group_item_label: "State"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: website {
    group_label: "Contact Details"
    label: "Contact Website"
    group_item_label: "State"
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: zip {
    group_label: "Contact Details"
    hidden: yes
    type: zipcode
    sql: ${TABLE}.zip ;;
  }


}
