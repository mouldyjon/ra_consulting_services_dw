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

explore: xero_profit_and_loss {
  label: "Company Finances"
}





explore: customer_master {
  label: "Rittman Analytics Operations"
  view_label: "01 Clients, Prospects and Suppliers"

  join: customer_metrics {
    view_label: "01 Clients, Prospects and Suppliers"
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
    view_label: "13 Development Projects"
    sql_on: ${project_mapping.project_name} = ${dev_projects.name};;
    type: inner
    relationship: one_to_one
  }

  join: dev_stories {
    view_label: "13 Development Projects"
    sql_on: ${dev_projects.id} = ${dev_stories.project_id};;
    type: left_outer
    relationship: one_to_many
  }


  join: invoices {
    view_label: "08 Client Project Invoices"

    sql_on: ${customer_master.harvest_customer_id} = ${invoices.client_id};;

    relationship: one_to_many
    type: left_outer

  }

  join: harvest_forecast_entries {
    view_label: "08 Client Project Invoices"
    sql_on: ${customer_master.harvest_customer_id} = ${harvest_forecast_entries.client_harvest_id}
    ;;
    relationship: one_to_many
    type: left_outer


  }

  join: customer_events {
    view_label: "02 Client & Prospect Timeline"
    sql_on: ${customer_master.customer_id} = ${customer_events.customer_id};;
    relationship: one_to_many
    type: left_outer

  }

  join: customer_event_journey {
    view_label: "02 Client & Prospect Timeline"
    sql_on: ${customer_master.customer_id} = ${customer_event_journey.customer_id};;
    relationship: one_to_many
    type: left_outer
  }

  join: communications {
    view_label: "11 Client, Prospect & Partner Communications"

    sql_on: ${customer_master.hubspot_company_id} = ${communications.hubspot_company_id};;
    relationship: one_to_many
    type: left_outer
  }

  join: account_transactions {
    view_label: "09 Bank Transactions"
    sql_on: ${customer_master.xero_contact_id} = ${account_transactions.xero_company_id} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: xero_invoices_and_payments {
    view_label: "10 Xero Invoices "
    sql_on: ${customer_master.xero_contact_id} = ${xero_invoices_and_payments.xero_company_id} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: pageviews {
    view_label: "12 Websites Pageviews"
    sql_on: ${customer_master.site_visitor_customer_id} = ${pageviews.site_visitor_customer_id}  ;;
    relationship: one_to_many
    type: left_outer
  }

  join: invoice_line_items {
    view_label: "08 Client Project Invoices"
    sql_on: ${invoices.id} = ${invoice_line_items.invoice_id} ;;
       relationship: one_to_many
    type: left_outer
  }
  join: projects {
    view_label: "05 Client Projects"
    sql_on: ${customer_master.harvest_customer_id} = ${projects.client_id};;
    relationship: one_to_many
    type: left_outer

  }
  join: time_entries {
    view_label: "06 Client Project Timesheets"

    sql_on: ${time_entries.project_id} = ${projects.id} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: project_tasks {
    view_label: "06 Client Project Timesheets"
      relationship: one_to_many
    sql_on:  ${project_tasks.project_id} = ${projects.id};;
  }

  join: tasks {
    view_label: "06 Client Project Timesheets"

    sql_on: ${tasks.id} = ${project_tasks.task_id};;
    relationship: many_to_one
    type: inner
  }




  join: users {
    view_label: "04 Consultants"
    sql_on: ${time_entries.user_id} = ${users.id}
         and ${users.id} = ${user_projects.user_id};;

    relationship: many_to_one
    type: inner
  }
  join: deals {
    view_label: "03 Sales Opportunities"

    sql_on: ${customer_master.hubspot_company_id} = ${deals.hubspot_company_id};;
    relationship: one_to_many

  }

  join: user_projects {
    view_label: "08 Client Project Invoices"

    sql_on: ${user_projects.id}  = ${projects.id}
    and ${user_projects.client_id} = ${customer_master.harvest_customer_id};;

    relationship: many_to_one
  }

  join: owners {
    view_label: "03 Sales Opportunities"
    sql_on: ${deals.hubspot_owner_id} = cast(${owners.ownerid} as string);;
    relationship: many_to_one
  }

  join: expenses {
    view_label: "07 Client Project Expenses"
    sql_on: ${customer_master.harvest_customer_id} = ${expenses.client_id}
    and ${expenses.project_id} =  ${projects.id};;
    relationship: one_to_many
    type: left_outer
  }






}
