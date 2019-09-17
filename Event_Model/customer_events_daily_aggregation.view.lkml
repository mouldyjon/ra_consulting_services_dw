# If necessary, uncomment the line below to include explore_source.
# include: "Customer_Event_Model.model.lkml"

view: customer_events_daily_aggregation {
  derived_table: {
    sql_trigger_value: SELECT count(*) from customer_events ;;
    explore_source: customer_master {
      column: customer_name {}
      column: event_ts_date { field: customer_events.event_ts_date }
      column: total_days_billed { field: customer_events.total_days_billed }
      column: total_jira_stories_completed { field: customer_events.total_jira_stories_completed }
      column: total_jira_tasks_completed { field: customer_events.total_jira_tasks_completed }
      column: total_looker_usage_mins { field: customer_events.total_looker_usage_mins }
      column: total_revenue_billed { field: customer_events.total_revenue_billed }
      column: total_revenue_invoiced { field: customer_events.total_revenue_invoiced }
      column: total_revenue_paid { field: customer_events.total_revenue_paid }
      filters: {
        field: customer_events.billable_client
        value: "Yes"
      }

    }
  }
  dimension: customer_name {
    label: "Customers Company Name"
  }
  dimension: event_ts_date {
    label: "Event History Event Date"
    type: date
  }
  dimension: total_days_billed {
    label: "Event History Total Days Billed"
    type: number
  }
  dimension: total_jira_stories_completed {
    label: "Event History Total Jira Stories Completed"
    type: number
  }
  dimension: total_jira_tasks_completed {
    label: "Event History Total Jira Tasks Completed"
    type: number
  }
  dimension: total_looker_usage_mins {
    label: "Event History Total Looker Usage Mins"
    type: number
  }
  dimension: total_revenue_billed {
    label: "Event History Total Revenue Billed"
    type: number
  }
  dimension: total_revenue_invoiced {
    label: "Event History Total Revenue Invoiced"
    type: number
  }
  dimension: total_revenue_paid {
    label: "Event History Total Revenue Paid"
    type: number
  }
}