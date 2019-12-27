connection: "ra_dw_prod"
label: "Rittman Analytics"

include: "*.view.lkml"                       # include all views in this project
aggregate_awareness:  yes





explore: all_history {
  label: "Looker Benchmarking"
  join: all_history_facts {
    sql_on: ${all_history.pk} = ${all_history_facts.pk} ;;
    type: inner
    relationship: one_to_one
  }
}

explore: financial_results {
  label: "Company Finances"
  join: xero_profit_and_loss {
    sql_on: ${financial_results.period_month} = ${xero_profit_and_loss.period_ts_month};;
    type: inner
    relationship: one_to_many
  }
}




explore: customer_master {
  label: "Rittman Analytics Operations"
  view_label: "Companies and Contacts"

 join: customer_revenue {
   view_label: "Companies and Contacts"
  type: left_outer
  relationship: one_to_one
  sql_on: ${customer_master.customer_id} = ${customer_revenue.customer_master_customer_id} ;;
 }

  join: customer_metrics {
    view_label: "Companies and Contacts"
    sql_on: ${customer_master.customer_id}  = ${customer_metrics.customer_id}  ;;
    type: left_outer
    relationship: one_to_one
  }




  join: project_mapping {
    view_label: "13 Development Projects"
    sql_on: ${customer_master.customer_name} = ${project_mapping.customer_name};;
    type: left_outer
    relationship: one_to_many
  }

  join: dev_projects {
    view_label: "Jira Issues"
    sql_on: ${project_mapping.project_name} = ${dev_projects.name};;
    type: inner
    relationship: one_to_one
  }







  join: dev_tasks {
    view_label: "Jira Issues"
    sql_on: ${dev_projects.id} = ${dev_tasks.project_id};;
    type: inner
    relationship: one_to_many
  }

  join: dev_subtasks {
    view_label: "Jira Issues"
    sql_on: ${dev_tasks.key} = ${dev_subtasks.parent_key};;
    type: inner
    relationship: one_to_many
  }







  join: harvest_invoices {
    view_label: "Harvest Invoicing"

    sql_on: ${customer_master.harvest_customer_id} = ${harvest_invoices.client_id};;

    relationship: one_to_many
    type: left_outer

  }



  join: customer_events {
    view_label: "Customer Lifecycle"
    sql_on: ${customer_master.customer_id} = ${customer_events.customer_id};;
    relationship: one_to_many
    type: left_outer

  }

  join: deals {
    sql_on: ${deals.deal_id} = ${bridge.deal_id}  ;;
    type: inner
    relationship: one_to_many
  }
  join: deals_history {
    view_label: "Hubspot Deal History"
    sql_on: ${deals_history.deal_id} = ${bridge.deal_id} ;;
    type: full_outer
    relationship: one_to_many
  }
  join: bridge {
    view_label: "Hubspot Companies"
    sql_on: ${customer_master.hubspot_company_id} = ${bridge.associatedcompanyids} ;;
    type: left_outer
    relationship: one_to_many
  }
#  join: owners {
#    view_label: "Hubspot Owners"
#    sql_on: ${deals.hubspot_owner_id} = (${owners.ownerid} as string);;
#    relationship: many_to_one
#  }
  join: communications {
    view_label: "Hubspot Conversations"
    sql_on: ${customer_master.hubspot_company_id} = ${communications.hubspot_company_id};;
    relationship: one_to_many
    type: left_outer
  }
  join: contacts {
    view_label: "Hubspot Contacts"
    sql_on: ${contacts.associatedcompanyid} = ${bridge.associatedcompanyids} ;;
    relationship: one_to_many
    type: inner
  }






  join: account_transactions {
    view_label: "Xero Accounting"
    sql_on: ${customer_master.xero_contact_id} = ${account_transactions.xero_company_id} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: xero_invoices_and_payments {
    view_label: "Xero Accounting"
    sql_on: ${customer_master.xero_contact_id} = ${xero_invoices_and_payments.xero_company_id} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: pageviews {
    view_label: "Website Analytics"
    sql_on: ${customer_master.customer_id} = cast(${pageviews.customer_id} as int64) ;;
    relationship: one_to_many
    type: inner
  }

  join: timesheets{
    view_label: "Harvest Project Timesheets and Invoicing"
    sql_on: ${customer_master.harvest_customer_id} = ${timesheets.client_id} ;;
    relationship: one_to_many
    type: left_outer
  }


  join: harvest_projects {
    view_label: "Harvest Project Timesheets and Invoicing"
    sql_on: ${timesheets.project_id} = ${harvest_projects.id};;
    relationship: many_to_one
    type: inner

  }


  join: harvest_tasks {
    view_label: "Harvest Project Timesheets and Invoicing"
    relationship: many_to_one
    sql_on: ${timesheets.task_id} = ${harvest_tasks.id} ;;
    type: inner
  }

  join: harvest_users {
    view_label: "Harvest Project Timesheets and Invoicing"
    relationship: many_to_one
    sql_on: ${timesheets.user_id} = ${harvest_users.id} ;;
    type: inner
    }

  join: harvest_timesheet_invoices {
    from: harvest_invoices
    relationship: one_to_many
    sql_on: ${timesheets.invoice_id} = ${harvest_timesheet_invoices.id} ;;
    type: left_outer
  }










}
