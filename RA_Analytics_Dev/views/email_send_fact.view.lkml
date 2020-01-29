view: email_send_fact {
  sql_table_name: ra_data_warehouse_dbt_dev.email_send_fact ;;

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension: archive_url {
    type: string
    sql: ${TABLE}.archive_url ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: count_bounces {
    type: number
    sql: ${TABLE}.count_bounces ;;
  }

  dimension: count_clicks {
    type: number
    sql: ${TABLE}.count_clicks ;;
  }

  dimension: count_opens {
    type: number
    sql: ${TABLE}.count_opens ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email_id {
    type: string
    sql: ${TABLE}.email_id ;;
  }

  dimension: from_name {
    type: string
    sql: ${TABLE}.from_name ;;
  }

  dimension: has_authenticate {
    type: yesno
    sql: ${TABLE}.has_authenticate ;;
  }

  dimension: has_auto_footer {
    type: yesno
    sql: ${TABLE}.has_auto_footer ;;
  }

  dimension: has_auto_tweet {
    type: yesno
    sql: ${TABLE}.has_auto_tweet ;;
  }

  dimension: has_fb_comments {
    type: yesno
    sql: ${TABLE}.has_fb_comments ;;
  }

  dimension: is_drag_and_drop {
    type: yesno
    sql: ${TABLE}.is_drag_and_drop ;;
  }

  dimension: list_id {
    type: string
    sql: ${TABLE}.list_id ;;
  }

  dimension: list_is_active {
    type: yesno
    sql: ${TABLE}.list_is_active ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}.list_name ;;
  }

  dimension: number_emails_sent {
    type: number
    sql: ${TABLE}.number_emails_sent ;;
  }

  dimension: preview_text {
    type: string
    sql: ${TABLE}.preview_text ;;
  }

  dimension: recipient_count {
    type: number
    sql: ${TABLE}.recipient_count ;;
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
  }

  dimension: send_id {
    type: string
    sql: ${TABLE}.send_id ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sent_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject_line {
    type: string
    sql: ${TABLE}.subject_line ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}.template_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: to_name {
    type: string
    sql: ${TABLE}.to_name ;;
  }

  measure: count {
    type: count
    drill_fields: [list_name, from_name, to_name]
  }
}
