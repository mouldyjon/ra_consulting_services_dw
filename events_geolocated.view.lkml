view: events_geolocated {
  sql_table_name: personal_data.events_geolocated_2 ;;

  dimension: apple_music_album_name {
    group_label: "Music Played"
    type: string
    sql: ${TABLE}.apple_music_album_name ;;
  }

  dimension: apple_music_artist_name {
    group_label: "Music Played"

    type: string
    sql: ${TABLE}.apple_music_artist_name ;;
  }

  dimension: calories_earned_count {
    group_label: "Health Tracking"
    hidden: yes

    type: string
    sql: ${TABLE}.calories_earned_count ;;
  }

  measure: avg_calories_earned_count {
    group_label: "Health Tracking"

    type: average
    sql: ${TABLE}.calories_earned_count ;;
  }

  measure: sum_calories_earned_count {
    group_label: "Health Tracking"

    type: sum
    sql: ${TABLE}.calories_earned_count ;;
  }

  dimension: calories_passive_count {
    group_label: "Health Tracking"
    hidden: yes

    type: string
    sql: ${TABLE}.calories_passive_count ;;
  }

  measure: avg_calories_passive_count {
    group_label: "Health Tracking"

    type: average
    sql: ${TABLE}.calories_passive_count ;;
  }

  measure: total_calories_passive_count {
    group_label: "Health Tracking"

    type: sum
    sql: ${TABLE}.calories_passive_count ;;
  }


  dimension: cycling_activity_score {
    group_label: "Cycling Workouts"
    hidden: yes

    type: string
    sql: ${TABLE}.cycling_Activity_Score ;;
  }

  dimension: cycling_cad {
    group_label: "Cycling Workouts"

    type: number
    sql: ${TABLE}.cycling_Cad ;;
  }

  measure: avg_cycling_cad {
    label: "Average Cadence"
    group_label: "Cycling Workouts"

    type: average
    sql: ${TABLE}.cycling_cad ;;
  }



  dimension: cycling_elv_m {
    group_label: "Cycling Workouts"
    hidden: yes

    type: number
    sql: ${TABLE}.cycling_Elv_m ;;
  }

  measure: avg_cycling_elv_m {
    group_label: "Cycling Workouts"

    type: average
    sql: ${TABLE}.cycling_elv_m ;;
  }

  measure: total_cycling_elv_m {
    group_label: "Cycling Workouts"

    type: sum
    sql: ${TABLE}.cycling_elv_m ;;
  }


  dimension: cycling_energy_kg {
    group_label: "Cycling Workouts"
    hidden: yes

    type: string
    sql: ${TABLE}.cycling_energy_kg ;;
  }

  measure: avg_cycling_energy_kg {
    group_label: "Cycling Workouts"
    hidden: yes

    type: average
    sql: ${TABLE}.cycling_energy_kg ;;
  }

  dimension: cycling_gear {
    group_label: "Cycling Workouts"

    type: string
    sql: ${TABLE}.cycling_Gear ;;
  }

  dimension: cycling_intensity_pct {
    group_label: "Cycling Workouts"

    type: string
    sql: ${TABLE}.cycling_intensity_pct ;;
  }

  measure: avg_cycling_intensity_pct {
    group_label: "Cycling Workouts"

    type: average
    value_format_name: percent_0
    sql: ${TABLE}.cycling_intensity_pct ;;
  }

  dimension: cycling_kudos {
    group_label: "Cycling Workouts"
    hidden: yes

    type: number
    sql: ${TABLE}.cycling_Kudos ;;
  }

  measure: avg_cycling_kudos {
    group_label: "Cycling Workouts"

    type: average
    sql: ${TABLE}.cycling_kudos ;;
  }

  measure: total_cycling_kudos {
    group_label: "Cycling Workouts"

    type: sum
    sql: ${TABLE}.cycling_kudos ;;
  }


  dimension: cycling_max_pwr_w {
    group_label: "Cycling Workouts"
    hidden: yes

    type: string
    sql: ${TABLE}.cycling_Max_Pwr_W ;;
  }

  dimension: cycling_prs {
    group_label: "Cycling Workouts"
    hidden: yes
    type: number
    sql: ${TABLE}.cycling_PRs ;;
  }

  measure: avg_cycling_prs {
    group_label: "Cycling Workouts"

    type: average
    sql: ${TABLE}.cycling_prs ;;
  }

  measure: total_cycling_prs {
    group_label: "Cycling Workouts"

    type: sum
    sql: ${TABLE}.cycling_prs ;;
  }


  dimension: cycling_pwr_w {
    group_label: "Cycling Workouts"
    hidden: yes

    type: string
    sql: ${TABLE}.cycling_Pwr_W ;;
  }

  dimension: cycling_relative_effort {
    group_label: "Cycling Workouts"

    type: number
    sql: ${TABLE}.cycling_Relative_Effort ;;
  }

  dimension: cycling_segs {
    group_label: "Cycling Workouts"
    hidden: yes

    type: number
    sql: ${TABLE}.cycling_Segs ;;
  }

  dimension: cycling_training_load {
    group_label: "Cycling Workouts"
    hidden: yes

    type: string
    sql: ${TABLE}.cycling_Training_Load ;;
  }

  dimension: driving_score {
    group_label: "Journeys"
    hidden: yes

    type: string
    sql: ${TABLE}.driving_score ;;
  }

  measure: avg_driving_score {
    group_label: "Journeys"

    type: average
    sql: ${TABLE}.driving_score ;;
  }

  dimension: event_address {
    group_label: "Event Location"

    type: string
    sql: ${TABLE}.event_address ;;
  }

  dimension: event_category {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_category ;;
  }

  dimension: event_country {
    group_label: "Event Location"

    type: string
    sql: ${TABLE}.event_country ;;
  }

  dimension: event_details {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_details ;;
  }

  dimension: event_details_full {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_details_full ;;
  }

  dimension: event_distance_km {
    group_label: "Event Details"

    type: number
    sql: cast(${TABLE}.event_distance_km as float64) ;;
  }

  dimension: start_end_distance {
    type: distance
    group_label: "Event Details"
    start_location_field: event_lat_long
    end_location_field: event_end_lat_long
    units: kilometers
  }

  measure: avg_event_distance_km {
  group_label: "Event Details"
    value_format_name: decimal_0

  type: average
  sql: cast(${TABLE}.event_distance_km as float64) ;;
}

  measure: total_event_distance_km {
    group_label: "Event Details"
    value_format_name: decimal_0
    type: sum
    sql: cast(${TABLE}.event_distance_km as float64) ;;
  }

  dimension: event_duration_secs {
    group_label: "Event Details"

    type: number
    sql: cast(${TABLE}.event_duration_secs as float64) ;;
  }

  measure: avg_event_duration_secs {
    group_label: "Event Details"
    value_format_name: decimal_0

    type: average
    sql: ${TABLE}.event_duration_secs ;;
  }

  measure: total_event_duration_secs {
    group_label: "Event Details"
    value_format_name: decimal_0

    type: sum
    sql: ${TABLE}.event_duration_secs ;;
  }

  dimension: event_elapsed_duration_secs {
    group_label: "Cycling Workouts"

    type: number
    sql: cast(${TABLE}.event_elapsed_duration_secs as float64) ;;
  }

  measure: avg_elapsed_duration_secs {
    group_label: "Event Details"

    type: average
    sql: ${TABLE}.event_elapsed_duration_secs ;;
  }

  measure: total_elapsed_duration_secs {
    group_label: "Event Details"

    type: sum
    sql: ${TABLE}.event_elapsed_duration_secs ;;
  }

  dimension: event_end_address {
    group_label: "Event Location"

    type: string
    sql: ${TABLE}.event_end_address ;;
  }

  dimension: event_end_country {
    group_label: "Event Location"

    type: string
    sql: ${TABLE}.event_end_country ;;
  }

  dimension: event_end_lat_long {
    group_label: "Event Location"

    type: location
    sql_latitude: ${TABLE}.event_end_lat ;;
    sql_longitude:${TABLE}.event_end_long   ;;
  }

  dimension: event_end_location_name {
    group_label: "Event Location"

    type: string
    sql: ${TABLE}.event_end_location_name ;;
  }



  dimension: event_heart_rate {
    group_label: "Event Details"

    type: number
    sql: cast(${TABLE}.event_heart_rate as float64) ;;
  }

  measure: avg_event_heart_rate {
    group_label: "Event Details"

    type: average
    sql: ${TABLE}.event_heart_rate ;;
  }

  dimension: event_lat_long {
    group_label: "Event Location"

    type: location
    sql_latitude: ${TABLE}.event_lat ;;
    sql_longitude:${TABLE}.event_long  ;;
  }

  dimension: event_location_name {
    group_label: "Event Location"

    type: string
    sql: ${TABLE}.event_location_name ;;
  }



  dimension: event_max_speed_kph {
    group_label: "Journeys"
    hidden: yes

    type: string
    sql: cast(${TABLE}.event_max_speed_kph as float64) ;;
  }

  measure: avg_event_max_speed_kph {
    group_label: "Journeys"

    type: average
    sql: ${TABLE}.event_max_speed_kph ;;
  }

  dimension: event_site_or_app {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_site_or_app ;;
  }

  dimension: event_source {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_source ;;
  }

  dimension: event_speed_kph {
    group_label: "Event Details"

    type: string
    sql: cast(${TABLE}.event_speed_kph as float64) ;;
  }

  measure: avg_event_speed_kph {
    group_label: "Journeys"

    type: average
    sql: ${TABLE}.event_speed_kph ;;
  }

  dimension: event_spend {
    group_label: "Money Spent"

    type: number
    sql: ${TABLE}.event_spend ;;
  }

  measure: total_event_spend {
    group_label: "Money Spent"

    type: sum
    sql: ${TABLE}.event_spend ;;
  }

  dimension: event_spend_currency {
    group_label: "Money Spent"

    type: string
    sql: ${TABLE}.event_spend_currency ;;
  }

  dimension: event_target {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_target ;;
  }

  dimension: event_temp_c {
    group_label: "Event Details"

    type: number
    sql: ${TABLE}.event_temp_c ;;
  }

  measure: avg_event_temp_c {
    group_label: "Event Details"

    type: average
    sql: ${TABLE}.event_temp_c ;;
  }

  dimension_group: event_ts {
    label: "Event"
    type: time
    timeframes: [
      raw,
      time,
      minute5,
      day_of_week,
      day_of_week_index,
      day_of_year,
      day_of_month,
      hour_of_day,
      quarter_of_year,
      week_of_year,
      date,
      week,
      month,
      month_num,
      month_name,
      quarter,
      year
    ]
    sql: timestamp(${TABLE}.event_ts) ;;
  }

  dimension: event_type {
    group_label: "Event Details"

    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: steps_count {
    group_label: "Health Tracking"
    hidden: yes
    type: number
    sql: ${TABLE}.steps_count ;;
  }

  measure: avg_steps_count {
    group_label: "Health Tracking"
    value_format_name: decimal_1

    type: average
    sql: ${TABLE}.steps_count ;;
  }

  measure: total_steps_count {
    group_label: "Health Tracking"

    type: sum
    sql: ${TABLE}.steps_count ;;
  }

  measure: avg_weight_chg_pct {
  group_label: "Health Tracking"
    value_format_name: percent_1

  type: average
  sql: ${TABLE}.weight_chg_pct ;;
  }

  measure: total_weight_kg_chg {
    value_format_name: decimal_1

    group_label: "Health Tracking"
    type: sum
    sql: ${TABLE}.weight_kg_chg ;;
  }

  measure: avg_fat_mass_kg {
    group_label: "Health Tracking"
    value_format_name: decimal_1

    type: average
    sql: ${TABLE}.fat_mass_kg ;;
  }

  measure: avg_weight_kg {
    group_label: "Health Tracking"
    value_format_name: decimal_1

    type: average
    sql: ${TABLE}.weight_kg ;;
  }


  measure: avg_muscle_mass_kg {
    group_label: "Health Tracking"
    type: average
    value_format_name: decimal_1
    sql: ${TABLE}.muscle_mass_kg ;;
  }

  dimension: body_fat_pct {
    type: number
    hidden: yes
    sql: ${TABLE}.fat_mass_kg/${TABLE}.weight_kg ;;
  }

  measure: avg_body_fat_pct {
    type: average
    group_label: "Health Tracking"
    value_format_name: percent_0
    sql: ${body_fat_pct} ;;
  }




  measure: count {
    type: count
    drill_fields: [event_end_location_name, apple_music_album_name, event_location_name, apple_music_artist_name]
  }
}
