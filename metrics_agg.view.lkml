view: metrics_agg {
    derived_table: {
      sql_trigger_value: select count(*) from customer_events ;;
      explore_source: customer_master {
        column: customer_name {}
        column: total_event_units { field: customer_events.total_event_units }
        column: total_event_value { field: customer_events.total_event_value }
        column: total_jira_tasks_completed { field: customer_events.total_jira_tasks_completed }
        column: event_ts_date { field: customer_events.event_ts_date }
      }
    }
    dimension: customer_name {
      label: "Customers Company Name"
    }
    dimension: total_event_units {
      label: "Event History Total Event Units"
      type: number
    }
    dimension: total_event_value {
      label: "Event History Total Event Value"
      type: number
    }
    dimension: total_jira_tasks_completed {
      label: "Event History Total Jira Tasks Completed"
      type: number
    }
    dimension: event_ts_date {
      label: "Event History Event Date"
      type: date
    }
  }
