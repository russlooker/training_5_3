
view: user_facts_ndt {
# If necessary, uncomment the line below to include explore_source.
# include: "training_5_3_18.model.lkml"
  derived_table: {
    explore_source: order_items {
      column: user_id {}
      column: total_sale_price {}
#       bind_filters: {
#         from_field: order_items.id
#         to_field: order_items.id
#       }
    }
    datagroup_trigger: nightly_etl
    distribution_style: even
    sortkeys: ["user_id"]
  }
  dimension: user_id {
    type: number
    primary_key: yes
  }
  dimension: total_sale_price {
    value_format: "$#,##0.00"
    type: number
  }

  measure: average_lifetime_revenue {
    type: average
    sql:  ${total_sale_price}  ;;
    value_format_name: usd
  }

}
