view: actuals_forecast {
  derived_table: {
    sql: SELECT
          customer_master.customer_name AS customer_name,
          (FORMAT_TIMESTAMP('%Y-%m', timestamp(deal_revenue_forecast.month_ts) )) AS month,
          'Forecast' as scenario,
          COALESCE(SUM(case when  ( CASE
            WHEN deals.current_stage_displayorder < 9 THEN 'Open'
            WHEN deals.current_stage_displayorder= 9 THEN 'Won'
            ELSE 'Lost'
            END )  = 'Open' then  ( deal_revenue_forecast.weighted_amount_monthly_forecast )  else 0 end ), 0) AS amount
      FROM customer_master  AS customer_master LEFT JOIN bridge_associatedcompanyids  AS bridge ON customer_master.hubspot_company_id = bridge.associatedcompanyids  INNER JOIN deals  AS deals ON deals.deal_id = bridge.deal_id  LEFT JOIN deal_revenue_forecast ON deals.deal_id = deal_revenue_forecast.deal_id
            and  (FORMAT_TIMESTAMP('%F %T', deals.dbt_valid_to )) is null
      GROUP BY
          1,
          2,
          3
      HAVING (COALESCE(SUM(case when (CASE
            WHEN deals.current_stage_displayorder < 9 THEN 'Open'
            WHEN deals.current_stage_displayorder= 9 THEN 'Won'
            ELSE 'Lost'
            END) = 'Open' then deal_revenue_forecast.weighted_amount_monthly_forecast else 0 end ), 0)  > 0)
      UNION ALL
      SELECT
          customer_master.customer_name AS customer_name,
              (FORMAT_TIMESTAMP('%Y-%m', harvest_invoices.created_at )) AS month,
                  'Actual' as scenario,
          COALESCE(SUM(ifnull(harvest_invoices.support_amount_billed,0) + ifnull(license_referral_fee_amount_billed,0) + ifnull(services_amount_billed,0)), 0) AS amount
      FROM customer_master AS customer_master
          LEFT JOIN client_invoices AS harvest_invoices ON customer_master.harvest_customer_id = harvest_invoices.client_id AND customer_master.harvest_customer_id IS NOT NULL
      WHERE ((harvest_invoices.created_at  ) >= ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL -5 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS TIMESTAMP)) AS STRING))))) AND (harvest_invoices.created_at  ) < ((TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL -5 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS TIMESTAMP)) AS STRING))) AS DATE), INTERVAL 6 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP(CONCAT(CAST(DATE_ADD(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS DATE), INTERVAL -5 MONTH) AS STRING), ' ', CAST(TIME(CAST(TIMESTAMP_TRUNC(CAST(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY) AS TIMESTAMP), MONTH) AS TIMESTAMP)) AS STRING))) AS TIMESTAMP)) AS STRING))))))
      GROUP BY
          1,
          2,
          3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}.scenario ;;
  }

  measure: amount {
    type: sum
    value_format_name: gbp
    sql: ${TABLE}.amount ;;
  }

  set: detail {
    fields: [customer_name, month, scenario, amount]
  }
}
