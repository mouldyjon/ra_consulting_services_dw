view: account_transactions {
  sql_table_name: account_transactions ;;

  dimension: account_bankaccounttype {
    group_label: "Chart of Accounts"
    type: string
    sql: ${TABLE}.account_bankaccounttype ;;
  }

  dimension: account_class {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_class ;;
  }

  dimension: account_description {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_description ;;
  }

  dimension: account_name {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_reportingcode {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_reportingcode ;;
  }

  dimension: account_reportingcodename {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_reportingcodename ;;
  }

  dimension: account_status {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_status ;;
  }

  dimension: account_systemaccount {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_systemaccount ;;
  }

  dimension: account_taxtype {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_taxtype ;;
  }

  dimension: account_type {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: accountcode {
    group_label: "Chart of Accounts"

    type: string
    sql: ${TABLE}.accountcode ;;
  }

  dimension: bank_account_accountid {
    group_label: "Bank Account"

    type: string
    sql: ${TABLE}.bank_account_accountid ;;
  }

  dimension: bank_account_name {
    group_label: "Bank Account"

    type: string
    sql: ${TABLE}.bank_account_name ;;
  }

  dimension: banktransactionid {
    group_label: "Bank Account"
    primary_key: yes
    type: string
    sql: ${TABLE}.banktransactionid ;;
  }

  dimension: contact_name {
    hidden: yes
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension: contactid {
    hidden: yes

    type: string
    sql: ${TABLE}.contactid ;;
  }

  dimension: contactnumber {
    hidden: yes

    type: string
    sql: ${TABLE}.contactnumber ;;
  }

  dimension: currencycode {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.currencycode ;;
  }



  dimension: description {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: isreconciled {
    group_label: "Transaction Details"

    type: yesno
    sql: ${TABLE}.isreconciled ;;
  }

  dimension: itemcode {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.itemcode ;;
  }

  dimension: lineamount {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.lineamount ;;
  }

  dimension: lineamounttypes {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.lineamounttypes ;;
  }

  dimension: quantity {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: reference {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: subtotal {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension: taxamount {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.taxamount ;;
  }

  dimension: taxtype {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.taxtype ;;
  }

  dimension: transaction_amount {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.total ;;
  }

  measure: total_transaction_amount {
    type: sum
    sql: ${TABLE}.total ;;
  }

  dimension: totaltax {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.totaltax ;;
  }

  dimension_group: transaction {
    group_label: "Transaction Details"

    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_status {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.transaction_status ;;
  }

  dimension: transaction_type {
    group_label: "Transaction Details"

    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: unitamount {
    group_label: "Transaction Details"

    type: number
    sql: ${TABLE}.unitamount ;;
  }

  dimension: xero_company_id {
    hidden: yes
    type: string
    sql: ${TABLE}.xero_company_id ;;
  }


}
