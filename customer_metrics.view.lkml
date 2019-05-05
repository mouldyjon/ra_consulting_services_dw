view: customer_metrics {
  derived_table: {
    sql: select customer_id, avg(total_invoice_amount) as avg_invoice_amount, sum(total_invoice_amount) as total_invoice_amount, avg(payment_days_late) as avg_days_late
      from (
      SELECT
        xero_invoices_and_payments.invoice_type  AS xero_invoices_and_payments_invoice_type,
        CAST(xero_invoices_and_payments.duedate  AS DATE) AS xero_invoices_and_payments_duedate_date,
        customer_master.customer_id  AS customer_id,
        CAST(xero_invoices_and_payments.invoice_date  AS DATE) AS xero_invoices_and_payments_invoice_date,
        CAST(xero_invoices_and_payments.fullypaidondate  AS DATE) AS xero_invoices_and_payments_fullypaidondate_date,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(xero_invoices_and_payments.total ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(xero_invoices_and_payments.invoiceid  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(xero_invoices_and_payments.invoiceid  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(xero_invoices_and_payments.invoiceid  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(xero_invoices_and_payments.invoiceid  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS total_invoice_amount,
        timestamp_diff(xero_invoices_and_payments.fullypaidondate,xero_invoices_and_payments.duedate,DAY) as payment_days_late
      FROM ra_data_warehouse.customer_master  AS customer_master
      LEFT JOIN ra_data_warehouse.xero_invoices_and_payments  AS xero_invoices_and_payments ON customer_master.xero_contact_id = xero_invoices_and_payments.xero_company_id

      WHERE
        (xero_invoices_and_payments.invoice_type = 'Receivable')
      GROUP BY 1,2,3,4,5,7)
      group by 1
 ;;
  }

  measure: count {
    type: count
  }

  dimension: customer_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  measure: avg_invoice_amount {
    group_label: "Customer Metrics"
    value_format_name: gbp_0

    type: average
    sql: ${TABLE}.avg_invoice_amount ;;
  }

  measure: total_invoice_amount {
    group_label: "Customer Metrics"
    value_format_name: gbp_0
    type: sum
    sql: ${TABLE}.total_invoice_amount ;;
  }

  measure: avg_invoice_days_paid_late {
    group_label: "Customer Metrics"
    type: average
    sql: round(${TABLE}.avg_days_late,0) ;;
  }


}