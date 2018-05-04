include: "training_5_3_18_base.model.lkml"

include: "corelogic_training.dashboard.lookml"  # include all dashboards in this project

include: "sales*.view.lkml"


explore: order_items {
  extends: [order_items_base]
  label: "Sales Team Revenue Metrics"
#   fields: [ALL_FIELDS*, -order_items.user_id]


}


explore: events {}

explore: events_full {}
