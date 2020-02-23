view: qubit_merchandising {
  derived_table: {
    sql: SELECT *,
         row_number() over (partition by brand, Views__Date order by Transactions_Sum_of_Transaction_Total desc) as product_transaction_rank,
        row_number() over (partition by brand, Views__Date order by Total_Product___Future_Revenue desc) as product_trans_and_future_rank,
        case when row_number() over (partition by brand, Views__Date order by Transactions_Sum_of_Transaction_Total desc) <= 10 then true else false end as is_daily_hero_product,
        Transactions_Sum_of_Transaction_Total / sum(Transactions_Sum_of_Transaction_Total) over (partition by brand, Views__Date) as transaction_total_pct_of_day_total
        FROM `ra-development.qubit_dev.merchandising_all`
        where product_interaction_and_sales_name is not null
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_interaction_and_sales_name {
    type: string
    label: "Product"

    group_label: "Merchandise"
    sql: ${TABLE}.Product_Interaction_and_Sales_Name ;;
  }

  dimension_group: trading {
    type: time
    sql: timestamp(${TABLE}.Views__Date) ;;
    timeframes: [date,week,week_of_year,month,month_num]
  }

  dimension: views__day_of_week {
    hidden: yes
    type: string
    sql: ${TABLE}.Views__Day_of_Week ;;
  }

  dimension: product_interaction_and_sales_category {
    group_label: "Merchandise"

    label: "Category"
    type: string
    sql: ${TABLE}.Product_Interaction_and_Sales_Category ;;
  }

  dimension: product_interaction_and_sales_subcategory {
    group_label: "Merchandise"

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

  measure: total_product_interaction_and_sales_converters {
    label: "Total Customers"
    group_label: "Revenue"

    hidden: no
    type: sum
    sql: ${TABLE}.Product_Interaction_and_Sales_Converters ;;
  }

  measure: transaction_total_pct_of_day_total {
    label: "Avg % of Total Daily Brand Revenue"
    group_label: "Revenue"
    value_format_name: percent_1

    type: average
  }

  measure: avg_product_interaction_and_sales_converters {
    label: "Avg Customers"
    group_label: "Revenue"
    value_format_name: decimal_0

    hidden: no
    type: sum
    sql: ${TABLE}.Product_Interaction_and_Sales_Converters ;;
  }

  dimension: transactions_sum_of_transaction_total {
    hidden: yes

    type: number
    sql: ${TABLE}.Transactions_Sum_of_Transaction_Total ;;
  }

  measure: total_transactions_sum_of_transaction_total {
    hidden: no
    label: "Product Revenue"
    group_label: "Revenue"
    value_format_name: decimal_0
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

  measure: avg_product_interaction_and_sales_converter_total_repeat_orders {
    hidden: no
    group_label: "Revenue"

    label: "Average Customer Future Orders"
    type: average
    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Total_Repeat_Orders ;;
  }

  measure: total_product_interaction_and_sales_converter_total_repeat_orders {
    hidden: no
    group_label: "Revenue"

    label: "Total Customer Future Orders"
    type: average
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
    label: "AOV"

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

  measure: avg_product_interaction_and_sales_product_average_price {
    hidden: no
    group_label: "Revenue"

    label: "Average Price"
    type: average
    sql: ${TABLE}.Product_Interaction_and_Sales_Product_Average_Price ;;
  }



  dimension: product_interaction_and_sales_product_visitors {
    hidden: yes

    type: number
    sql: ${TABLE}.Product_Interaction_and_Sales_Product_Visitors ;;
  }

  measure: avg_product_visitors {
    hidden: no
    group_label: "Customers"
    type: average
    sql: ${total_product_visitors} ;;
  }

  measure: total_product_visitors {
    group_label: "Customers"

    hidden: no
    type: sum
    sql: ${total_product_visitors} ;;
  }

  dimension: views_views {
    hidden: yes


    type: number
    sql: ${TABLE}.Views_Views ;;
  }

  measure: total_views_views {
    hidden: yes
    label: "Total Product Views"

    type: sum
    sql: ${TABLE}.Views_Views ;;
  }

  measure: avg_views_views {
    hidden: yes
    label: "Avg Product Views"

    type: sum
    sql: ${TABLE}.Views_Views ;;
  }

  dimension: previous_converter_aov {
    hidden: no
    value_format_name: decimal_0
    group_label: "AOV"

    type: number
    sql: ${TABLE}.Previous_Converter_AOV ;;
  }

   measure: avg_previous_converter_aov {
    hidden: no
    value_format_name: decimal_0
    group_label: "AOV"

    type: average
    sql: ${TABLE}.Previous_Converter_AOV ;;
  }

  dimension: future_converter_aov {
    hidden: no
    value_format_name: decimal_0
    group_label: "AOV"
    type: number
    sql: ${TABLE}.Future_Converter_AOV ;;
  }

  measure: avg_future_converter_aov {
    hidden: no

    group_label: "AOV"

    value_format_name: decimal_0
    type: average
    sql: ${TABLE}.Future_Converter_AOV ;;
  }


  dimension: rank_total_revenue {
    hidden: no
    group_label: "Daily Brand Revenue Ranking"

    value_format_name: decimal_1

    type: number
    sql: ${TABLE}.product_transaction_rank ;;
  }

  measure: average_rank_total_day_revenue {
    hidden: no
    group_label: "Daily Brand Revenue Ranking"

    value_format_name: decimal_1

    type: average
    sql: ${TABLE}.product_transaction_rank ;;
  }

  dimension: rank_total_future_revenue {
    hidden: no

    group_label: "Daily Brand Revenue Ranking"

    value_format_name: decimal_1

    type: number
    sql: ${TABLE}.product_trans_and_future_rank ;;
  }


  dimension: rank_variance {
    type: number
    group_label: "Daily Brand Revenue Ranking"

    value_format_name: decimal_1

    sql: ${rank_total_future_revenue}-${rank_total_revenue} ;;
  }

  measure: total_rank_variance {
    type: sum
    value_format_name: decimal_1
    group_label: "Daily Brand Revenue Ranking"

    sql: ${rank_variance} ;;
  }

  measure: average_rank_variance {
    type: average
    group_label: "Daily Brand Revenue Ranking"

    value_format_name: decimal_0

    sql: ${rank_variance} ;;
  }

  measure: total_total_product___future_revenue {
    hidden: no
    label: "Total Product and Customer Future Revenue"
    type: sum
    group_label: "Revenue"

    value_format_name: decimal_0

    sql: ${TABLE}.Total_Product___Future_Revenue ;;
  }

  measure: total_total___future_revenue {
    hidden: no
    label: "Total Customer Future Revenue"
    type: sum
    group_label: "Revenue"

    value_format_name: decimal_0

    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Total_Future_Order_Value ;;
  }

  measure: avg_total___future_revenue {
    hidden: no
    label: "Average Customer Future Revenue"
    type: average
    group_label: "Revenue"

    value_format_name: decimal_0

    sql: ${TABLE}.Product_Interaction_and_Sales_Converter_Total_Future_Order_Value ;;
  }



  measure: avg_total_product___future_revenue {
    hidden: no
    label: "Avg Product and Customer Future Revenue"
    value_format_name: decimal_0
    group_label: "Revenue"

    type: average
    sql: ${TABLE}.Total_Product___Future_Revenue ;;
  }


  dimension: __customers_retained {
    hidden: yes

    type: number
    sql: ${TABLE}.__Customers_Retained ;;
  }

  measure: avg_customers_retained {
    hidden: yes
    group_label: "Customers"

    type: average
    sql: ${TABLE}.__Customers_Retained ;;
  }

  measure: total_customers_retained {
    hidden: yes
    group_label: "Customers"

    type: sum
    sql: ${TABLE}.__Customers_Retained ;;
  }

  dimension: brand {
    hidden: no
    group_label: "Merchandise"

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
      __customers_retained,
      brand
    ]
  }
}
