connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project



explore: order_items {
  label: "Ecommerce Model"
#   sql_always_where: ${order_items.order_id} IS NOT NULL ;;
#   always_filter: {
#     filters: {
#       field: order_items.id
#       value: "-NULL"
#     }
#   }
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


}


explore: users {
  view_label: "All Users"
}

# test
