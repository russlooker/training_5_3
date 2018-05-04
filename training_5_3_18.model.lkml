include: "training_5_3_18_base.model.lkml"



# persist_for: "24 hours"

datagroup: nightly_etl {
  sql_trigger: select current_date ;;
  max_cache_age: "24 hours"
}

explore: order_items {
  extends: [order_items_base]


  join: user_facts {
    type: left_outer
    sql_on: ${order_items.user_id} = ${user_facts.user_id}  ;;
    relationship: many_to_one
  }

  join: user_facts_ndt {
    type: left_outer
    sql_on: ${order_items.user_id} = ${user_facts_ndt.user_id}  ;;
    relationship: many_to_one
  }

}


explore: users {
  view_label: "All Users"
}

# test
