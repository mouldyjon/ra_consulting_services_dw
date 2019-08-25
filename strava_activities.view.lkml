view: strava_activities {
  sql_table_name: example_training_data.strava_activities ;;



  dimension: activity_score {
    type: number
    sql: ${TABLE}.Activity_Score ;;
  }



  dimension: cal {
    type: number
    sql: ${TABLE}.Cal ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }



  dimension: day_of_week {
    type: string
    sql: ${TABLE}.Day_of_Week ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }



  dimension: dist_km {
    type: number
    sql: ${TABLE}.Dist_km ;;
  }

  measure: total_dist_km {
    type: sum
    sql: ${dist_km} ;;
  }


  dimension: elapsed_time {
    type: number
    sql: ${TABLE}.Elapsed_Time ;;
  }

  measure: total_elapsed_time {
    type: sum
    sql: ${TABLE}.Elapsed_Time ;;
  }

  dimension: elev_dist_m_km {
    type: number
    sql: ${TABLE}.Elev_Dist_m_km ;;
  }

  dimension: elev_time_m_h {
    type: number
    sql: ${TABLE}.Elev_Time_m_h ;;
  }



  dimension: elv_m {
    type: number
    sql: ${TABLE}.Elv_m ;;
  }

  dimension: activity_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.activity_id ;;
  }


  dimension: gear {
    type: string
    sql: ${TABLE}.Gear ;;
  }

  dimension: group_size {
    type: number
    sql: ${TABLE}.Group_Size ;;
  }

  dimension: h_r_zone_1 {
    type: number
    sql: ${TABLE}.H_R_Zone_1 ;;
  }

  dimension: h_r_zone_2 {
    type: number
    sql: ${TABLE}.H_R_Zone_2 ;;
  }

  dimension: h_r_zone_3 {
    type: number
    sql: ${TABLE}.H_R_Zone_3 ;;
  }

  dimension: h_r_zone_4 {
    type: number
    sql: ${TABLE}.H_R_Zone_4 ;;
  }

  dimension: h_r_zone_5 {
    type: number
    sql: ${TABLE}.H_R_Zone_5 ;;
  }

  dimension: half_marathon {
    type: string
    sql: ${TABLE}.Half_Marathon ;;
  }

  dimension: heart {
    type: number
    sql: ${TABLE}.Heart ;;
  }

  dimension: intensity__ {
    type: string
    sql: ${TABLE}.Intensity__ ;;
  }

  dimension: kudos {
    type: number
    sql: ${TABLE}.Kudos ;;
  }

  dimension: man {
    type: number
    sql: ${TABLE}.Man ;;
  }

  dimension: marathon {
    type: string
    sql: ${TABLE}.Marathon ;;
  }

  dimension: max_heart {
    type: number
    sql: ${TABLE}.Max_Heart ;;
  }

  dimension: max_pace__100m {
    type: number
    sql: ${TABLE}.Max_Pace__100m ;;
  }

  dimension: max_pace__km {
    type: number
    sql: ${TABLE}.Max_Pace__km ;;
  }

  dimension: max_pwr_w {
    type: string
    sql: ${TABLE}.Max_Pwr_W ;;
  }

  dimension: max_speed_km_h {
    type: number
    sql: ${TABLE}.Max_Speed_km_h ;;
  }

  dimension: moving_time {
    type: number
    sql: ${TABLE}.Moving_Time ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }



  dimension: power_meter {
    type: number
    sql: ${TABLE}.Power_Meter ;;
  }

  dimension: pri {
    type: number
    sql: ${TABLE}.Pri ;;
  }

  dimension: prs {
    type: number
    sql: ${TABLE}.PRs ;;
  }

  dimension: pwr_w {
    type: number
    sql: ${TABLE}.Pwr_W ;;
  }

  dimension: relative_effort {
    type: number
    sql: ${TABLE}.Relative_Effort ;;
  }

  dimension: ride_run_type {
    type: string
    sql: ${TABLE}.Ride_Run_Type ;;
  }

  dimension: segment_prs__k_qom_positions_ {
    type: string
    sql: ${TABLE}.Segment_PRs__K_QOM_positions_ ;;
  }

  dimension: segs {
    type: number
    sql: ${TABLE}.Segs ;;
  }

  dimension: speed_hr {
    type: number
    sql: ${TABLE}.Speed_HR ;;
  }

  measure: speed_km_h {
    type: average
    sql: ${TABLE}.Speed_km_h ;;
  }

  dimension: start_time {
    type: number
    sql: ${TABLE}.Start_Time ;;
  }



  dimension: weighted_avg_pwr_w {
    type: number
    sql: ${TABLE}.Weighted_Avg_Pwr_W ;;
  }

  dimension_group: when {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.``When`` ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
