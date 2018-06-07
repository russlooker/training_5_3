view: user_facts {
  derived_table: {
    sql: SELECT
         user_id
        ,SUM(sale_price) as lifetime_revenue
      FROM
        public.order_items
      GROUP BY
        1
       ;;
#       sql_trigger_value:  select current_date;;
#   persist_for: "500 hours"

  datagroup_trigger: nightly_etl

  distribution_style: even
  sortkeys: ["user_id"]
#   indexes: ["id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }

  measure: average_lifetime_revenue {
    type: average
    sql: ${lifetime_revenue}  ;;
    value_format_name: usd
  }


  set: detail {
    fields: [user_id, lifetime_revenue]
  }
}
