view: customer_master {
  view_label: "Companies"
  sql_table_name: customer_master ;;

  filter: billable_client {
    hidden: no

    type: yesno
    sql: ${customer_events.billable_client} ;;
    default_value: "Yes"
  }




  dimension: customer_id {
    group_label: "Company Details"
    group_item_label: "ID"

    hidden: no
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    group_label: "Company Details"
group_item_label: "Name"
    label: "Company Name"
    type: string
    sql:
      ${TABLE}.customer_name;;
    link: {
      label: "Visit Company Website"
      url: "https://{{ customer_master.company_website._value }}"
    }
  }

  dimension: company_billing_address {
    group_label: "Company Details"
    label: "Company Billing Address"
    group_item_label: "Billing Address"
    type: string
    sql: ${TABLE}.harvest_address ;;
  }

  dimension_group: company_created {
    group_label: "Project Details"

    hidden: yes
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.harvest_customer_created_at ;;
  }



  dimension: harvest_customer_id {
    hidden: yes

    type: number
    sql: ${TABLE}.harvest_customer_id ;;
  }



  dimension: company_annual_revenue {
    group_label: "Customer Intelligence"
    hidden: yes
group_item_label: "Annual Revenue"
    type: number
    sql: ${TABLE}.hubspot_annual_revenue ;;
  }



  dimension: hubspot_company_id {
    group_label: "Company Details"

    hidden: yes

    type: number
    sql: ${TABLE}.hubspot_company_id ;;
  }



  dimension_group: company_first_contact {
    group_label: "Customer Intelligence"
    hidden: yes

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.hubspot_created_date ;;
  }

  dimension: company_description {
    group_label: "Company Details"
group_item_label: "Description"
    type: string
    sql: ${TABLE}.hubspot_description ;;
  }

  dimension: company_domain {
    group_label: "Company Details"
group_item_label: "Domain"
    type: string
    sql: ${TABLE}.hubspot_domain ;;
  }

  dimension_group: first_deal_created {
    group_label: "Company Details"
    hidden: yes

    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.hubspot_first_deal_created_date ;;
  }

  dimension: company_industry {
    group_label: "Company Details"
group_item_label: "Industry"
    type: string
    sql: ${TABLE}.hubspot_industry ;;
  }

  dimension: company_is_public {
    group_label: "Company Details"
    hidden: yes

    type: yesno
    sql: ${TABLE}.hubspot_is_public ;;
  }

  dimension: company_lifecycle_stage {
    group_label: "Company Details"
label: "Lifecycle Stage"
    type: string
    sql: ${TABLE}.hubspot_lifecycle_stage ;;
  }

  dimension: company_linkedin_bio {
    group_label: "Company Details"
group_item_label: "LinkedIn Bio"
    type: string
    sql: ${TABLE}.hubspot_linkedin_bio ;;
  }

  dimension: hubspot_owner_id {
    group_label: "Company Details"

    type: string
    hidden: yes

    sql: ${TABLE}.hubspot_owner_id ;;
  }

  dimension: state {
    group_label: "Company Details"
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_state ;;
  }

  dimension: company_total_money_raised {
    group_label: "Company Details"
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_total_money_raised ;;
  }

  dimension: company_total_revenue {
    group_label: "Company Details"
    hidden: yes

    type: number
    sql: ${TABLE}.hubspot_total_revenue ;;
  }

  dimension: company_twitterhandle {
    group_label: "Company Details"
    hidden: yes

    type: string
    sql: ${TABLE}.hubspot_twitterhandle ;;
  }

  dimension: company_type {
    group_label: "Company Details"
group_item_label: "Type"
    type: string
    sql: ${TABLE}.hubspot_type ;;
  }

  dimension: company_website {
    group_label: "Company Details"
    group_item_label: "Website"

    type: string
    sql: ${TABLE}.hubspot_website ;;
  }

  dimension: company_is_crm_tracked {
    group_label: "Company Details"
    hidden: yes

    type: yesno
    sql: ${TABLE}.is_crm_tracked_client ;;
  }

  dimension: company_is_services_client {
    group_label: "Company Details"
    hidden: yes

    type: yesno
    sql: ${TABLE}.is_services_client ;;
  }

  dimension: company_is_supplier_company {
    group_label: "Company Details"
    hidden: yes

    type: yesno
    sql: ${TABLE}.is_supplier_company ;;
  }

  dimension: xero_contact_id {
    type: string
    hidden: yes

    sql: ${TABLE}.xero_contact_id ;;
  }

  dimension: company_finance_status {
    group_label: "Finance Details"
    hidden: yes

    type: string
    sql: ${TABLE}.xero_customer_status ;;
  }

  dimension: company_is_customer{
    group_label: "Finance Details"
    hidden: yes

    type: yesno
    sql: ${TABLE}.xero_is_customer ;;
  }

  dimension: company_is_supplier {
    group_label: "Finance Details"
    hidden: yes

    type: yesno
    sql: ${TABLE}.xero_is_supplier ;;
  }


}
