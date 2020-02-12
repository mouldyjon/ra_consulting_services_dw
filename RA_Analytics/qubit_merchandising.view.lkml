view: qubit_merchandising {
  derived_table: {
    sql: SELECT * FROM `ra-development.qubit_dev.merchandising_all` LIMIT 10
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_interaction_and_sales_name {
    type: string
    label: "Product"
    sql: ${TABLE}.Product_Interaction_and_Sales_Name ;;
  }

  dimension_group: trading {
    type: time
    sql: timestamp(${TABLE}.Views__Date) ;;
    timeframes: [date,week,week_of_year]
  }

  dimension: views__day_of_week {
    hidden: yes
    type: string
    sql: ${TABLE}.Views__Day_of_Week ;;
  }

  dimension: product_interaction_and_sales_category {
    label: "Category"
    type: string
    sql: ${TABLE}.Product_Interaction_and_Sales_Category ;;
  }

  dimension: product_interaction_and_sales_subcategory {
    label: "Subcategory"

    type: string
    sql: ${TABLE}.Product_Interaction_and_Sales_Subcategory ;;
  }

  dimension: product_interaction_and_sales_converters {
    label: "Customers"
    hidden: yes
    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converters ;;
  }

  dimension: transactions_sum_of_transaction_total {
    hidden: yes

    type: number
    sql: ${TABLE}.Transactions_Sum_of_Transaction_Total ;;
  }

  measure: total_transactions_sum_of_transaction_total {
    hidden: yes
    label: "Product Revenue"
    type: sum
    sql: ${TABLE}.Transactions_Sum_of_Transaction_Total ;;
  }

  dimension: product_interaction_and_sales_count_of_new_customers {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Count_of_New_Customers ;;
  }

  dimension: product_interaction_and_sales_converter_total_repeat_orders {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Total_Repeat_Orders ;;
  }

  dimension: product_interaction_and_sales_converter_average_repeat_orders {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Average_Repeat_Orders ;;
  }

  dimension: product_interaction_and_sales_count_of_future_repeat_customers {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Count_of_Future_Repeat_Customers ;;
  }

  dimension: transactions_average_order_value {
    hidden: yes

    type: number
    sql: ${TABLE}.Transactions_Average_Order_Value ;;
  }

  measure: avg_transactions_average_order_value {
    hidden: yes
    label: "AOV"
    type: average
    sql: ${TABLE}.Transactions_Average_Order_Value ;;
  }




  dimension: product_interaction_and_sales_converter_previous_total_order_value {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Previous_Total_Order_Value ;;
  }

  dimension: product_interaction_and_sales_converter_total_previous_orders {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Total_Previous_Orders ;;
  }

  dimension: product_interaction_and_sales_converter_average_previous_orders {
        hidden: yes
        type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Average_Previous_Orders ;;
  }

  dimension: product_interaction_and_sales_converter_total_future_order_value {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Total_Future_Order_Value ;;
  }

  dimension: product_interaction_and_sales_product_purchaser_average_transaction_cycle {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Product_Purchaser_Average_Transaction_Cycle ;;
  }

  dimension: product_interaction_and_sales_product_average_price {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Product_Average_Price ;;
  }



  dimension: product_interaction_and_sales_product_visitors {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Product_Visitors ;;
  }

  dimension: views_views {
    hidden: yes

    type: number
    sql: ${TABLE}.Views_Views ;;
  }

  dimension: previous_converter_aov {
    hidden: yes

    type: number
    sql: ${TABLE}.Previous_Converter_AOV ;;
  }

   measure: avg_previous_converter_aov {
    hidden: no

    type: average
    sql: ${TABLE}.Previous_Converter_AOV ;;
  }

  dimension: future_converter_aov {
    hidden: yes

    type: number
    sql: ${TABLE}.Future_Converter_AOV ;;
  }

  measure: avg_future_converter_aov {
    hidden: no

    type: average
    sql: ${TABLE}.Future_Converter_AOV ;;
  }


  dimension: rank_total_revenue {
    hidden: yes

    type: number
    sql: ${TABLE}.Rank_Total_Revenue ;;
  }

  dimension: rank_total_future_revenue {
    hidden: yes

    type: number
    sql: ${TABLE}.Rank_Total_Future_Revenue ;;
  }

  dimension: rank_variance {
    type: number
    sql: ${rank_total_future_revenue}-${rank_total_revenue} ;;
  }

  measure: total_rank_variance {
    type: sum
    sql: ${rank_variance} ;;
  }

  dimension: total_product___future_revenue {
    hidden: yes

    type: number
    sql: ${TABLE}.Total_Product___Future_Revenue ;;
  }


  dimension: __customers_retained {
    hidden: yes

    type: number
    sql: ${TABLE}.__Customers_Retained ;;
  }

  dimension: brand {
    hidden: no

    type: string
    sql: ${TABLE}.brand ;;
  }

  set: detail {
    fields: [
      product_interaction_and_sales_name,
      views__day_of_week,
      product_interaction_and_sales_category,
      product_interaction_and_sales_subcategory,
      product_interaction_and_sales_converters,
      transactions_sum_of_transaction_total,
      product_interaction_and_sales_count_of_new_customers,
      product_interaction_and_sales_converter_total_repeat_orders,
      product_interaction_and_sales_converter_average_repeat_orders,
      product_interaction_and_sales_count_of_future_repeat_customers,
      transactions_average_order_value,
      product_interaction_and_sales_converter_previous_total_order_value,
      product_interaction_and_sales_converter_total_previous_orders,
      product_interaction_and_sales_converter_average_previous_orders,
      product_interaction_and_sales_converter_total_future_order_value,
      product_interaction_and_sales_product_purchaser_average_transaction_cycle,
      product_interaction_and_sales_product_average_price,
      product_interaction_and_sales_product_visitors,
      views_views,
      previous_converter_aov,
      future_converter_aov,
      rank_total_revenue,
      rank_total_future_revenue,
      total_product___future_revenue,
      __customers_retained,
      brand
    ]
  }
}
