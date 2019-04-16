view: company_bank_transactions {
  view_label: "Bank Transactions"
  sql_table_name: ra_data_warehouse.company_bank_transactions ;;

  dimension: bank_account_accountid {
    hidden: yes
    type: string
    sql: ${TABLE}.bank_account_accountid ;;
  }

  dimension: bank_account_name {
    type: string
    sql: ${TABLE}.bank_account_name ;;
  }

  dimension: banktransactionid {
    primary_key: yes
     type: string
    sql: ${TABLE}.banktransactionid ;;
  }



  dimension: xero_company_id {
    type: string
    hidden: yes
    sql: ${TABLE}.contactid ;;
  }

  dimension: contactnumber {
    hidden: yes
    type: string
    sql: ${TABLE}.contactnumber ;;
  }

  dimension: currencycode {
    label: "Bank Transaction Currency Code"
    type: string
    sql: ${TABLE}.currencycode ;;
  }



  dimension: isreconciled {
    label: "Transaction Reconciled"

    type: yesno
    sql: ${TABLE}.isreconciled ;;
  }

  dimension: lineamounttypes {
    label: "Transaction Line Amount Types"

    type: string
    sql: ${TABLE}.lineamounttypes ;;
  }

  dimension: reference {
    label: "Transaction Reference"

    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: status {
    label: "Transaction Status"

    type: string
    sql: ${TABLE}.status ;;
  }


  dimension: transaction_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: total_transaction_amount {
    type: sum
    sql: ${TABLE}.total ;;
  }

  measure: total_debit_transaction_amount {
    type: sum
    sql: case when ${TABLE}.type = 'SPEND' then ${TABLE}.total end ;;

}

  measure: total_credit_transaction_amount {
    type: sum
     sql: case when ${TABLE}.type <> 'SPEND' then ${TABLE}.total end ;;
  }


  dimension: totaltax {
    type: number
    sql: ${TABLE}.totaltax ;;
  }

  measure: total_transaction_tax {
    type: sum
    sql: ${TABLE}.totaltax ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.type ;;
  }


  measure: count_transactions {
    type: count
  }
}
