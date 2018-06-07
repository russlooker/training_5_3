view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: my_email {
    sql: {{ _user_attributes["email"] }} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  filter: selected_emails  {
    type: string
    suggest_dimension: users.email
    suggest_explore: users
  }


  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_comparison {
    type: string
    sql:
    CASE WHEN {% condition selected_emails %} ${email} {% endcondition %} THEN 'Group'
    ELSE 'Rest of Population'
    END ;;
  }



  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  parameter: age_threshold {
    type: number

  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
#     map_layer_name: u
  }
#Heiarchical Drill Example
#   3)
  measure: count {
    type: count
#     drill_fields: [zip,]

  }
#   1)
  measure: count_state {
    type: count
    drill_fields: [zip,count_zip]
  }
#   2)
  measure: count_zip {
    type: count
    drill_fields: [zip,count]
  }



}
