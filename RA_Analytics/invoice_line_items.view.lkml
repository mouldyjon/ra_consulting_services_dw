view: invoice_line_items {
  sql_table_name: rittman_analytics.invoice_line_items ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }



  dimension: project_invoice_line_item_amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
  }

  measure: total_project_invoice_line_item_amount {
    hidden: yes

    type: sum
    sql: ${TABLE}.amount ;;
  }

  dimension: project_invoice_line_item_description {
    hidden: yes
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: invoice_id {
    type: number
    hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: project_invoice_line_item_kind {
    hidden: yes

    type: string
    sql: ${TABLE}.kind ;;
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_id ;;
  }

  dimension: project_invoice_line_item_quantity {
    type: number
    hidden: yes

    sql: ${TABLE}.quantity ;;
  }

  measure: total_project_invoice_line_item_quantity {
    hidden: yes

    type: sum
    sql: ${TABLE}.quantity ;;
  }

  dimension: project_invoice_taxed {
    hidden: yes

    type: yesno
    sql: ${TABLE}.taxed ;;
  }



  dimension: project_invoice_line_item_unit_price {
    type: number
    hidden: yes
    sql: ${TABLE}.unit_price ;;
  }

  measure: avg_project_invoice_line_item_unit_price {
    hidden: yes

    type: average
    sql: ${TABLE}.unit_price ;;
  }



  measure: count_project_invoice_line_item {
    hidden: yes

    type: count

  }
}
