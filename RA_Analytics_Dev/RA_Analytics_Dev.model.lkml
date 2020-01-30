connection: "ra_dw"
label: "Rittman Analytics Dev"

include: "./views/*.view.lkml"                       # include all views in this project
aggregate_awareness:  yes

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
