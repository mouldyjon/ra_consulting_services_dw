connection: "ra_dw"
label: "Rittman Analytics Dev"

include: "./views/*.view.lkml"                       # include all views in this project
aggregate_awareness:  yes

explore: email_contacts_dim {
  label: "Company Marketing"
  view_label: "      Contacts & Lists"

  join: email_list_membership_fact {
    view_label: "      Contacts & Lists"
    type: left_outer
    relationship: one_to_many
    sql_on: ${email_contacts_dim.email_id} = ${email_list_membership_fact.email_id} AND (
          ${email_contacts_dim.valid_from_raw} = ${email_contacts_dim.valid_from_raw}
            );;
  }

  join: email_lists_dim {
    view_label: "      Contacts & Lists"
    sql_on: ${email_lists_dim.list_id}  = ${email_list_membership_fact.list_id}  ;;
    type: left_outer
    relationship: one_to_many
  }

  join: email_segment_membership_fact {
    view_label: "      Contacts & Lists"

    sql_on: ${customer_master.harvest_customer_id} = ${harvest_invoices.client_id}
      and ${customer_master.harvest_customer_id} is not null;;
    relationship: one_to_many
    type: left_outer

  }

  join: email_segments_dim {
    view_label: "      Contacts & Lists"
    sql_on: ${customer_master.customer_id} = ${customer_events.customer_id};;
    relationship: one_to_many
    type: left_outer

  }

  join: email_campaigns_dim {
    view_label: "   Campaigns & Sends"
    sql_on: ${deals.deal_id} = ${bridge.deal_id} ;;
    type: inner
    relationship: one_to_many
  }
  join: email_campaign_content_links_dim {
    view_label: "   Campaigns & Sends"
    sql_on: ${deals.deal_id} = ${deal_revenue_forecast.deal_id}
      and  ${deals.historic_record_valid_to_time} is null;;
    type: left_outer
    relationship: one_to_many
  }
  join: email_send_fact {
    view_label: "   Campaigns & Sends"
    sql_on: ${customer_master.hubspot_company_id} = ${bridge.associatedcompanyids} ;;
    type: left_outer
    relationship: one_to_many
  }

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

}
