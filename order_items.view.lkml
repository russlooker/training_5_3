view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
#     primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: pk {
    type: string
    hidden:  yes
    primary_key: yes
    sql:  ${id} || '-' || ${user_id}  ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      hour_of_day,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

#   dimension: created_week {
#     type: date_week
#     sql:  ${TABLE}.created_at ;;
#   }



  dimension_group: delivered {
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
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
#     group_label: "Row Level Data"
    type: number
    sql: ${TABLE}.sale_price * .8 ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
#     group_label: "Row Level Data"
    type: string
    sql: lower(${TABLE}.status) ;;
  }

#   dimension: status_user {
#     type: string
#     sql: ${status} || '-' || ${user_id}  ;;
#   }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price}  ;;
    value_format_name: usd
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      inventory_items.id,
      inventory_items.product_name,
      users.id,
      users.last_name,
      users.first_name
    ]
  }
}
