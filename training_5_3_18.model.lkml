connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project



explore: order_items {
#   sql_always_where: ${order_items.order_id} IS NOT NULL ;;
#   always_filter: {
#     filters: {
#       field: order_items.id
#       value: "-NULL"
#     }
#   }
}


# test
