connection: "ra_dw_prod"
label: "Rittman Analytics"

include: "*.view.lkml"                       # include all views in this project
aggregate_awareness:  yes



explore: actuals_forecast {}

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
  view_label: "      Customers & Prospects"

 join: customer_revenue {
  view_label: "      Customers & Prospects"
  type: left_outer
  relationship: one_to_one
  sql_on: ${customer_master.customer_id} = ${customer_revenue.customer_master_customer_id} ;;
 }

  join: customer_metrics {
    view_label: "      Customers & Prospects"
    sql_on: ${customer_master.customer_id}  = ${customer_metrics.customer_id}  ;;
    type: left_outer
    relationship: one_to_one
  }


  join: harvest_invoices {
    view_label: "    Project Delivery"

    sql_on: ${customer_master.harvest_customer_id} = ${harvest_invoices.client_id}
    and ${harvest_invoices.project_id} = ${harvest_projects.id};;

    relationship: one_to_many
    type: left_outer

  }



  join: customer_events {
    view_label: "      Customers & Prospects"
    sql_on: ${customer_master.customer_id} = ${customer_events.customer_id};;
    relationship: one_to_many
    type: left_outer

  }

  join: deals {
    view_label: "   Sales"
    sql_on: ${deals.deal_id} = ${bridge.deal_id} ;;
    type: inner
    relationship: one_to_many
  }
  join: deal_revenue_forecast {
    view_label: "   Sales"
    sql_on: ${deals.deal_id} = ${deal_revenue_forecast.deal_id}
      and  ${deals.historic_record_valid_to_time} is null;;
    type: left_outer
    relationship: one_to_many
  }
  join: bridge {
    view_label: "   Sales"
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
    view_label: "   Sales"
    sql_on: ${customer_master.hubspot_company_id} = ${communications.hubspot_company_id};;
    relationship: one_to_many
    type: left_outer
  }
  join: contacts {
    view_label: "      Customers & Prospects"
    sql_on: ${contacts.associatedcompanyid} = ${bridge.associatedcompanyids} ;;
    relationship: one_to_many
    type: inner
  }

  join: tickets {
    view_label: "    Project Delivery"
    sql_on: ${customer_master.customer_id} = ${tickets.customer_id} ;;
    relationship: one_to_many
    type: left_outer
  }






  join: account_transactions {
    view_label: "  Finance"
    sql_on: ${customer_master.xero_contact_id} = ${account_transactions.xero_company_id} ;;
    relationship: one_to_many
    type: left_outer

  }





  join: timesheets{
    view_label: "    Project Delivery"
    sql_on: ${customer_master.harvest_customer_id} = ${timesheets.client_id} ;;
    relationship: one_to_many
    type: left_outer
  }


  join: harvest_projects {
    view_label: "    Project Delivery"
    sql_on: ${timesheets.project_id} = ${harvest_projects.id}
      ;;
    relationship: many_to_one
    type: inner

  }

  join: project_deal_details {
    view_label: "    Project Delivery"
    sql_on: ${harvest_projects.code} = ${project_deal_details.harvest_project_id} ;;
    relationship: one_to_one
    type: left_outer
  }


  join: harvest_tasks {
    view_label: "    Project Delivery"
    relationship: many_to_one
    sql_on: ${timesheets.task_id} = ${harvest_tasks.id} ;;
    type: left_outer
  }

  join: harvest_users {
    view_label: "    Project Delivery"
    relationship: many_to_one
    sql_on: ${timesheets.user_id} = ${harvest_users.id} ;;
    type: inner
    }
}



explore: email_contacts_dim {
  label: "Company Marketing"
  view_label: "      Contacts & Lists"

  join: email_list_membership_fact {
    view_label: "      Contacts & Lists"
    sql_on: ${email_contacts_dim.email_id} = ${email_list_membership_fact.email_id} AND
          ${email_contacts_dim._sdc_batched_raw} = ${email_list_membership_fact._sdc_batched_raw}
          ;;
    type: left_outer
    relationship: one_to_many
  }

  join: email_lists_dim {
    view_label: "      Contacts & Lists"
    sql_on: ${email_list_membership_fact.list_id} = ${email_lists_dim.list_id} AND
      ${email_list_membership_fact._sdc_batched_raw} = ${email_lists_dim._sdc_batched_raw};;
    type: left_outer
    relationship: many_to_one
  }

  join: email_segment_membership_fact {
    view_label: "      Contacts & Lists"
    sql_on: ${email_contacts_dim.email_id} = ${email_segment_membership_fact.email_id} AND
      ${email_contacts_dim._sdc_batched_raw} = ${email_segment_membership_fact._sdc_batched_raw} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: email_segments_dim {
    view_label: "      Contacts & Lists"
    sql_on: ${email_segment_membership_fact.segment_id} = ${email_segments_dim.segment_id} AND
      ${email_segment_membership_fact._sdc_batched_raw} = ${email_segments_dim._sdc_batched_raw};;
    relationship: many_to_one
    type: left_outer
  }

  join: email_send_fact {
    view_label: "   Campaigns & Sends"
    sql_on: ${email_contacts_dim.email_id} = ${email_send_fact.email_id} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: email_campaigns_dim {
    view_label: "   Campaigns & Sends"
    sql_on: ${email_send_fact.campaign_id} = ${email_campaigns_dim.campaign_id} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: email_campaign_content_links_dim {
    view_label: "   Campaigns & Sends"
    sql_on: ${email_campaigns_dim.campaign_id} = ${email_campaign_content_links_dim.campaign_id};;
    type: left_outer
    relationship: one_to_many
  }
}
