view: email_campaign_content_links_dim {
  sql_table_name: ra_data_warehouse_dbt_dev.email_campaign_content_links_dim ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.campaign_id, ${TABLE}.url) ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
