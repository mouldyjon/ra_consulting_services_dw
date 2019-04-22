view: customer_master {
  view_label: "Companies"
  sql_table_name: ra_data_warehouse.customer_master ;;

  filter: billable_client {
    hidden: no

    type: yesno
    sql: ${customer_events.billable_client} ;;
    default_value: "Yes"
  }

  dimension: customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: harvest_address {
    type: string
    sql: ${TABLE}.harvest_address ;;
  }

  dimension_group: harvest_customer_created {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.harvest_customer_created_at ;;
  }

  dimension: harvest_customer_currency {
    type: string
    sql: ${TABLE}.harvest_customer_currency ;;
  }

  dimension: harvest_customer_id {
    hidden: yes

    type: number
    sql: ${TABLE}.harvest_customer_id ;;
  }

  dimension: harvest_customer_is_active {
    type: yesno
    sql: ${TABLE}.harvest_customer_is_active ;;
  }

  dimension: hubspot_annual_revenue {
    type: number
    sql: ${TABLE}.hubspot_annual_revenue ;;
  }

  dimension: hubspot_city {
    type: string
    sql: ${TABLE}.hubspot_city ;;
  }

  dimension: hubspot_company_id {
    hidden: yes

    type: number
    sql: ${TABLE}.hubspot_company_id ;;
  }

  dimension: hubspot_country {
    type: string
    sql: ${TABLE}.hubspot_country ;;
  }

  dimension_group: hubspot_created {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.hubspot_created_date ;;
  }

  dimension: hubspot_description {
    type: string
    sql: ${TABLE}.hubspot_description ;;
  }

  dimension: hubspot_domain {
    type: string
    sql: ${TABLE}.hubspot_domain ;;
  }

  dimension_group: hubspot_first_deal_created {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.hubspot_first_deal_created_date ;;
  }

  dimension: hubspot_industry {
    type: string
    sql: ${TABLE}.hubspot_industry ;;
  }

  dimension: hubspot_is_public {
    type: yesno
    sql: ${TABLE}.hubspot_is_public ;;
  }

  dimension: hubspot_lifecycle_stage {
    type: string
    sql: ${TABLE}.hubspot_lifecycle_stage ;;
  }

  dimension: hubspot_linkedin_bio {
    type: string
    sql: ${TABLE}.hubspot_linkedin_bio ;;
  }

  dimension: hubspot_owner_id {
    type: string
    hidden: yes

    sql: ${TABLE}.hubspot_owner_id ;;
  }

  dimension: hubspot_state {
    type: string
    sql: ${TABLE}.hubspot_state ;;
  }

  dimension: hubspot_total_money_raised {
    type: string
    sql: ${TABLE}.hubspot_total_money_raised ;;
  }

  dimension: hubspot_total_revenue {
    type: number
    sql: ${TABLE}.hubspot_total_revenue ;;
  }

  dimension: hubspot_twitterhandle {
    type: string
    sql: ${TABLE}.hubspot_twitterhandle ;;
  }

  dimension: hubspot_type {
    type: string
    sql: ${TABLE}.hubspot_type ;;
  }

  dimension: hubspot_website {
    type: string
    sql: ${TABLE}.hubspot_website ;;
  }

  dimension: is_crm_tracked_client {
    type: yesno
    sql: ${TABLE}.is_crm_tracked_client ;;
  }

  dimension: is_services_client {
    type: yesno
    sql: ${TABLE}.is_services_client ;;
  }

  dimension: is_supplier_company {
    type: yesno
    sql: ${TABLE}.is_supplier_company ;;
  }

  dimension: xero_contact_id {
    type: string
    hidden: yes

    sql: ${TABLE}.xero_contact_id ;;
  }

  dimension: xero_customer_status {
    type: string
    sql: ${TABLE}.xero_customer_status ;;
  }

  dimension: xero_is_customer {
    type: yesno
    sql: ${TABLE}.xero_is_customer ;;
  }

  dimension: xero_is_supplier {
    type: yesno
    sql: ${TABLE}.xero_is_supplier ;;
  }

  measure: count_companies {

    type: count_distinct
    sql_distinct_key: ${customer_id} ;;
    drill_fields: [customer_name]
  }
}
