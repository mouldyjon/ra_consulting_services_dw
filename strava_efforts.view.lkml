view: strava_efforts {
  sql_table_name: example_training_data.strava_efforts ;;

  dimension: activity {
    type: string
    sql: ${TABLE}.Activity ;;
  }

  dimension: activity_id {
    type: number
    sql: ${TABLE}.Activity_Id ;;
  }

  dimension: bearing {
    type: number
    sql: ${TABLE}.Bearing ;;
  }

  dimension: cadence {
    type: number
    sql: ${TABLE}.Cadence ;;
  }

  dimension: cat {
    type: string
    sql: ${TABLE}.Cat ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: cmts {
    type: number
    sql: ${TABLE}.Cmts ;;
  }

  dimension: dist_km {
    type: number
    sql: ${TABLE}.Dist_km ;;
  }

  dimension: elapsed_time {
    type: number
    sql: ${TABLE}.Elapsed_Time ;;
  }

  dimension: elv_change_m {
    type: number
    sql: ${TABLE}.Elv_change_m ;;
  }

  dimension: elv_gain_m {
    type: number
    sql: ${TABLE}.Elv_gain_m ;;
  }

  dimension: gear {
    type: string
    sql: ${TABLE}.Gear ;;
  }

  dimension: grade__ {
    type: number
    sql: ${TABLE}.Grade__ ;;
  }

  dimension: group_size {
    type: number
    sql: ${TABLE}.Group_Size ;;
  }

  dimension: heart_rate {
    type: number
    sql: ${TABLE}.Heart_Rate ;;
  }

  dimension: max_elv_m {
    type: number
    sql: ${TABLE}.Max_Elv_m ;;
  }

  dimension: max_grade__ {
    type: number
    sql: ${TABLE}.Max_Grade__ ;;
  }

  dimension: max_hr {
    type: number
    sql: ${TABLE}.Max_HR ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: pace__100m {
    type: number
    sql: ${TABLE}.Pace__100m ;;
  }

  dimension: pace__km {
    type: number
    sql: ${TABLE}.Pace__km ;;
  }

  dimension: power__w_ {
    type: number
    sql: ${TABLE}.Power__W_ ;;
  }

  dimension: pr_pos {
    type: number
    sql: ${TABLE}.PR_Pos ;;
  }

  dimension: pr_pos_score {
    type: number
    sql: ${TABLE}.PR_Pos_Score ;;
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}.Segment_Id ;;
  }

  dimension: speed_km_h {
    type: number
    sql: ${TABLE}.Speed_km_h ;;
  }

  dimension: star {
    type: number
    sql: ${TABLE}.Star ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: temp___c {
    type: number
    sql: ${TABLE}.Temp___C ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }

  dimension: tries {
    type: number
    sql: ${TABLE}.Tries ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
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
