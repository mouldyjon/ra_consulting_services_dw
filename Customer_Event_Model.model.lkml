connection: "ra_dw_prod"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
aggregate_awareness: yes
explore: customer_events {}
