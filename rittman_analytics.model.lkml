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
  label: "Companies"
  join: invoices {
    sql_on: ${customer_master.harvest_customer_id} = ${invoices.client_id};;
    relationship: one_to_many
    type: left_outer

  }
  join: projects {
    sql_on: ${customer_master.harvest_customer_id} = ${projects.client_id};;
    relationship: one_to_many
    type: left_outer

  }
  join: time_entries {
    view_label: "Timesheets"

    sql_on: ${customer_master.harvest_customer_id} = ${time_entries.client_id}
    and  ${time_entries.project_id} = ${projects.id};;
    relationship: one_to_many
    type: left_outer
  }
  join: deals {
    view_label: "Sales Opportunities"

    sql_on: ${customer_master.hubspot_company_id} = ${deals.hubspot_company_id};;
    relationship: one_to_many

  }

  join: expenses {
    view_label: "Project Expenses"
    sql_on: ${customer_master.harvest_customer_id} = ${expenses.client_id}
    and ${expenses.project_id} =  ${projects.id};;
    relationship: one_to_many
    type: left_outer
  }



}
