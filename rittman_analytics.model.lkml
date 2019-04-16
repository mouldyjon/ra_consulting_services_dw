connection: "mjr_analytics_dw"

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
explore: customer_master {
  label: "Operations"
  join: invoices {
    view_label: "Project Invoices"

    sql_on: ${customer_master.harvest_customer_id} = ${invoices.client_id};;
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

  join: users {
    view_label: "Consultants"
    sql_on: ${time_entries.user_id} = ${users.id} ;;
    relationship: many_to_one
    type: inner
  }
  join: deals {
    view_label: "Sales Opportunities"

    sql_on: ${customer_master.hubspot_company_id} = ${deals.hubspot_company_id};;
    relationship: one_to_many

  }

  join: owners {
    view_label: "Sales Opportunities"
    sql_on: ${deals.hubspot_owner_id} = ${owners.ownerid};;
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
