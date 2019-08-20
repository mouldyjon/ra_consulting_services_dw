connection: "ra_dw_prod"
label: "Rittman Analytics"

include: "*.view.lkml"                       # include all views in this project






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
    view_label: "Jira Projects"
    sql_on: ${project_mapping.project_name} = ${dev_projects.name};;
    type: inner
    relationship: one_to_one
  }

  join: dev_stories {
    view_label: "Jira Projects"
    sql_on: ${dev_projects.id} = ${dev_stories.project_id};;
    type: left_outer
    relationship: one_to_many
  }


  join: invoices {
    view_label: "Harvest Project Timesheets and Invoicing"

    sql_on: ${customer_master.harvest_customer_id} = ${invoices.client_id};;

    relationship: one_to_many
    type: left_outer

  }

  join: harvest_forecast_entries {
    view_label: "Harvest Project Forecasts"
    sql_on: ${customer_master.harvest_customer_id} = ${harvest_forecast_entries.client_harvest_id}
    and ${projects.id} = ${harvest_forecast_entries.project_harvest_id}
    ;;
    relationship: one_to_many
    type: left_outer


  }

  join: customer_events {
    view_label: "Customer Lifecycle"
    sql_on: ${customer_master.customer_id} = ${customer_events.customer_id};;
    relationship: one_to_many
    type: left_outer

  }



  join: communications {
    view_label: "Hubspot Conversations"

    sql_on: ${customer_master.hubspot_company_id} = ${communications.hubspot_company_id};;
    relationship: one_to_many
    type: left_outer
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


  join: projects {
    view_label: "Harvest Project Timesheets and Invoicing"
    sql_on: ${customer_master.harvest_customer_id} = ${projects.client_id};;
    relationship: one_to_many
    type: left_outer

  }
  join: time_entries {
    view_label: "Harvest Project Timesheets and Invoicing"

    sql_on: ${time_entries.project_id} = ${projects.id} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: project_tasks {
    view_label: "Harvest Project Timesheets and Invoicing"
    relationship: one_to_many
    sql_on:  ${project_tasks.project_id} = ${projects.id};;
  }

  join: tasks {
    view_label: "Harvest Project Timesheets and Invoicing"

    sql_on: ${tasks.id} = ${project_tasks.task_id};;
    relationship: many_to_one
    type: inner
  }




  join: users {
    view_label: "Harvest Project Timesheets and Invoicing"
    sql_on: ${time_entries.user_id} = ${users.id}
         and ${users.id} = ${user_projects.user_id};;

    relationship: many_to_one
    type: inner
  }
  join: deals {
    view_label: "Hubspot Deal Tracking"

    sql_on: ${customer_master.hubspot_company_id} = ${deals.hubspot_company_id};;
    relationship: one_to_many

  }

  join: user_projects {
    view_label: "Harvest Project Timesheets and Invoicing"

    sql_on: ${user_projects.id}  = ${projects.id}
    and ${user_projects.client_id} = ${customer_master.harvest_customer_id};;

    relationship: many_to_one
  }

  join: owners {
    view_label: "Hubspot Deal Tracking"
    sql_on: ${deals.hubspot_owner_id} = cast(${owners.ownerid} as string);;
    relationship: many_to_one
  }

  join: expenses {
    view_label: "Harvest Project Timesheets and Invoicing"
    sql_on: ${invoices.id} = ${expenses.invoice_id};;
    relationship: one_to_many
    type: left_outer
  }






}
