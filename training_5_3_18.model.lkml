connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project



explore: order_items {
  label: "Ecommerce Model"
# The following are ways to attach a mandatory filter in looker
# The user cannot change:
#   sql_always_where: ${order_items.order_id} IS NOT NULL ;;
# The user can change:
  always_filter: {
    filters: {
      field: order_items.id
      value: "NOT NULL"
    }
  }
# conditionally_filter: {
#   filters: {
#     field: order_items.created_date
#     value: "today"
#   }
#   unless: [order_items.status]
# }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: one_to_one
  }


  join: users {
    view_label: "Ordering Users"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

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
