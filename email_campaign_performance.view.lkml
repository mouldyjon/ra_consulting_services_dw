view: email_campaign_performance {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:
      SELECT
        C.campaign_id AS Campaign_Id,
        title AS Campaign_Name,
        subject_line AS Subject_Line,
        Count_Of_Opens,
        Count_Of_Clicks,
        Count_Of_Bounces,
        Open_Rate,
        Click_Rate,
        Bounce_Rate
      FROM
        `ra-development.ra_data_warehouse_dbt_dev.email_campaigns_dim` C
        INNER JOIN
        (SELECT
          SUM(count_opens) AS Count_Of_Opens,
          SUM(count_clicks) AS Count_Of_Clicks,
          SUM(count_bounces) AS Count_Of_Bounces,
          ROUND((SUM(count_opens)/MAX(recipient_count)),3) AS Open_Rate,
          ROUND((SUM(count_clicks)/MAX(recipient_count)),3) AS Click_Rate,
          ROUND((SUM(count_bounces)/MAX(recipient_count)),3) AS Bounce_Rate,
          campaign_id
        FROM
        `ra-development.ra_data_warehouse_dbt_dev.email_send_fact`
        GROUP BY campaign_id
        ) s
        ON C.campaign_id = s.campaign_id
        ;;
  }
#
#   # Define your dimensions and measures here, like this:
  dimension: campaign_id {
    description: "Unique ID for each campaign sent"
    type: string
    sql: ${TABLE}.campaign_id ;;
  }
#
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
}
