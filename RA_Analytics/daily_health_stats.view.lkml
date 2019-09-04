view: daily_health_stats {
  sql_table_name: example_training_data.daily_health_stats ;;

  dimension: active_calories_kcal {
    type: number
    sql: ${TABLE}.Active_Calories_kcal ;;
  }

  dimension: basal_body_temperature_deg_c {
    type: number
    sql: ${TABLE}.Basal_Body_Temperature_degC ;;
  }

  dimension: body_fat_percentage {
    type: number
    sql: ${TABLE}.Body_Fat_Percentage ;;
  }

  dimension: body_mass_index {
    type: number
    sql: ${TABLE}.Body_Mass_Index ;;
  }

  dimension: body_temperature_deg_c {
    type: number
    sql: ${TABLE}.Body_Temperature_degC ;;
  }

  dimension: cycling_distance_mi {
    type: number
    sql: ${TABLE}.Cycling_Distance_mi ;;
  }

  dimension: dietary_water_l {
    type: number
    sql: ${TABLE}.Dietary_Water_L ;;
  }

  dimension: finish {
    type: string
    sql: ${TABLE}.Finish ;;
  }

  dimension: flights_climbed_count {
    type: number
    sql: ${TABLE}.Flights_Climbed_count ;;
  }

  dimension: heart_rate_count_min {
    type: number
    sql: ${TABLE}.Heart_Rate_count_min ;;
  }

  dimension: lean_body_mass_lb {
    type: number
    sql: ${TABLE}.Lean_Body_Mass_lb ;;
  }

  dimension: oxygen_saturation {
    type: number
    sql: ${TABLE}.Oxygen_Saturation ;;
  }

  dimension: respiratory_rate {
    type: number
    sql: ${TABLE}.Respiratory_Rate ;;
  }

  dimension: resting_calories_kcal {
    type: number
    sql: ${TABLE}.Resting_Calories_kcal ;;
  }

  dimension: start {
    type: string
    sql: ${TABLE}.Start ;;
  }

  dimension: steps__count {
    type: number
    sql: ${TABLE}.Steps__count ;;
  }

  dimension: steps__count_ {
    type: number
    sql: ${TABLE}.Steps__count_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
