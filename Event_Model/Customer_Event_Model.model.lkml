connection: "ra_dw_prod"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
aggregate_awareness: yes
explore: customer_master {
  label: "Rittman Analytics Operations"
  view_label: "Customers"
  join: customer_events {
    sql_on: ${customer_master.customer_id} = ${customer_events.customer_id} ;;
    view_label: "Event History"

    type: inner
    relationship: one_to_many
  }
  join: customer_event_journey {
    sql_on: ${customer_master.customer_id} = ${customer_event_journey.customer_id} ;;
    type: inner
    view_label: "Event Sequence"

    relationship: one_to_one
  }

  }
