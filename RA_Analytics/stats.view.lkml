view: stats {
  derived_table: {
    sql: select year, week_number, total_hours_worked, avg_daily_efficiency, total_km_cycled, avg_weight_kg, avg_fat_mass_pct, total_steps, avg_sleep_hrs, distance_travelled_km from daily_activity.stats

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: week_number {
    type: number
    sql: ${TABLE}.week_number ;;
  }

  measure: total_hours_worked {
    type: sum
    sql: ${TABLE}.total_hours_worked ;;
  }

  measure: avg_daily_efficiency {
    type: average
    sql: ${TABLE}.avg_daily_efficiency ;;
  }

  measure: total_km_cycled {
    type: sum
    sql: ${TABLE}.total_km_cycled ;;
  }

  measure: avg_weight_kg {
    type: average
    sql: ${TABLE}.avg_weight_kg ;;
  }

  measure: avg_sleep_hrs {
    type: average
    sql: ${TABLE}.avg_sleep_hrs ;;
  }

  measure: avg_fat_mass_pct {
    type: average
    sql: ${TABLE}.avg_fat_mass_pct ;;
  }

  measure: distance_travelled_km   {
    type: sum
    sql: ${TABLE}.distance_travelled_km  ;;
  }

  measure: total_steps {
    type: sum
    sql: ${TABLE}.total_steps ;;
  }

  set: detail {
    fields: [
      year,
      week_number,
      total_hours_worked,
      avg_daily_efficiency,
      total_km_cycled,
      avg_weight_kg,
      avg_fat_mass_pct,
      total_steps
    ]
  }
}
