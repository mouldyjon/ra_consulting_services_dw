view: email_campaigns_dim {
  sql_table_name: ra_data_warehouse_dbt_dev.email_campaigns_dim ;;

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

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
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

  dimension_group: max_sdc_batched {
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
    sql: ${TABLE}.max_sdc_batched_at ;;
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

  dimension: resendable {
    type: yesno
    sql: ${TABLE}.resendable ;;
  }

  dimension: segment_conditions {
    hidden: yes
    sql: ${TABLE}.segment_conditions ;;
  }

  dimension: segment_match {
    type: string
    sql: ${TABLE}.segment_match ;;
  }

  dimension: segment_opts {
    hidden: yes
    sql: ${TABLE}.segment_opts ;;
  }

  dimension: segment_text {
    type: string
    sql: ${TABLE}.segment_text ;;
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

  dimension: timewarp {
    type: yesno
    sql: ${TABLE}.timewarp ;;
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

view: email_campaigns_dim__segment_conditions {
  dimension: condition_type {
    type: string
    sql: ${TABLE}.condition_type ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: op {
    type: string
    sql: ${TABLE}.op ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: email_campaigns_dim__segment_opts {
  dimension: conditions {
    hidden: yes
    sql: ${TABLE}.conditions ;;
  }

  dimension: match {
    type: string
    sql: ${TABLE}.match ;;
  }

  dimension: saved_segment_id {
    type: number
    sql: ${TABLE}.saved_segment_id ;;
  }
}

view: email_campaigns_dim__segment_opts__conditions {
  dimension: condition_type {
    type: string
    sql: ${TABLE}.condition_type ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: op {
    type: string
    sql: ${TABLE}.op ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
