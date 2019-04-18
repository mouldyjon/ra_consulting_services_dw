connection: "mjr_analytics_dw"
label: "Rittman Analytics"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: customer_events {
  label: "Client Timeline"
  sql_always_where: ${billable_client} is true or ${sales_prospect} is true;;
  join: customer_master {
   sql_on: ${customer_events.customer_id} = ${customer_master.customer_id} ;;
   relationship: many_to_one
   type: inner
  }
}

explore: customer_master {
  label: "Operations"
  join: invoices {
    view_label: "Project Invoices"

    sql_on: ${customer_master.harvest_customer_id} = ${invoices.client_id};;
    relationship: one_to_many
    type: left_outer

  }

  join: communications {
    sql_on: ${customer_master.hubspot_company_id} = ${communications.hubspot_company_id};;
    relationship: one_to_many
    type: left_outer
  }

  join: company_bank_transactions {
    view_label: "Bank Transactions"
    sql_on: ${customer_master.xero_contact_id} = ${company_bank_transactions.xero_company_id} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: invoice_line_items {
    view_label: "Project Invoices"
    sql_on: ${invoices.id} = ${invoice_line_items.invoice_id} ;;
       relationship: one_to_many
    type: left_outer
  }
  join: projects {
    view_label: "Projects"
    sql_on: ${customer_master.harvest_customer_id} = ${projects.client_id};;
    relationship: one_to_many
    type: left_outer

  }
  join: time_entries {
    view_label: "Project Time Entries"

    sql_on: ${time_entries.project_id} = ${projects.id};;
    relationship: one_to_many
    type: left_outer
  }

  join: project_tasks {
    view_label: "Project Time Entries"
      relationship: one_to_many
    sql_on:  ${project_tasks.project_id} = ${projects.id};;
  }

  join: tasks {
    view_label: "Project Time Entries"

    sql_on: ${tasks.id} = ${project_tasks.task_id};;
    relationship: many_to_one
    type: inner
  }

  join: user_project_tasks {
    view_label: "Project Time Entries"

    sql_on: ${user_project_tasks.user_id} = ${users.id};;

    relationship: many_to_one
    type: inner


  }

  join: users {
    view_label: "Consultants"
    sql_on: ${time_entries.user_id} = ${users.id}
         and ${users.id} = ${user_projects.user_id};;

    relationship: many_to_one
    type: inner
  }
  join: deals {
    view_label: "Sales Opportunities"

    sql_on: ${customer_master.hubspot_company_id} = ${deals.hubspot_company_id};;
    relationship: one_to_many

  }

  join: user_projects {
    sql_on: ${user_projects.id}  = ${projects.id}
    and ${user_projects.client_id} = ${customer_master.harvest_customer_id};;

    relationship: many_to_one
  }

  join: owners {
    view_label: "Sales Opportunities"
    sql_on: ${deals.hubspot_owner_id} = cast(${owners.ownerid} as string);;
    relationship: many_to_one
  }

  join: expenses {
    view_label: "Project Expenses"
    sql_on: ${customer_master.harvest_customer_id} = ${expenses.client_id}
    and ${expenses.project_id} =  ${projects.id};;
    relationship: one_to_many
    type: left_outer
  }






}
