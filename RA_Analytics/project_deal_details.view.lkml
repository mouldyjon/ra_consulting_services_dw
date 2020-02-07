view: project_deal_details {
  view_label: "Client Delivery Projects"

    derived_table: {
      explore_source: customer_master {
        column: opportunity_name { field: deals.opportunity_name }
        column: pricing_model { field: deals.pricing_model }
        column: products_in_solution { field: deals.products_in_solution }
        column: sprint_type { field: deals.sprint_type }
        column: partner_referral_type { field: deals.partner_referral_type }
        column: assigned_consultant { field: deals.assigned_consultant }
        column: opportunity_closed_date { field: deals.opportunity_closed_date }
        column: salesperson { field: deals.salesperson }
        column: harvest_project_id { field: deals.harvest_project_id }
        column: services_all_deals_total_amount { field: deals.services_all_deals_total_amount }
      }
    }
    dimension: opportunity_name {
      group_label: "Related Sales Deal"
      label: "   Sales Deal Name"
    }
    dimension: pricing_model {
      group_label: "Related Sales Deal"

      label: "   Sales Deal Pricing Model"
    }
    dimension: products_in_solution {
      group_label: "Related Sales Deal"

      label: "   Sales Deal Products in Solution"
    }
    dimension: sprint_type {
      group_label: "Related Sales Deal"

      label: "   Sales Deal Sprint Type"
    }
    dimension: partner_referral_type {
      group_label: "Related Sales Deal"

      label: "   Sales Partner Channel"
    }
    dimension: assigned_consultant {
      group_label: "Related Deal"

      label: "   Sales Assigned Consultant"
    }
    dimension: opportunity_closed_date {
      group_label: "Related Sales Deal"

      label: "   Sales Deal Close Date"
      type: date
    }
    dimension: salesperson {
      group_label: "Related Sales Deal"

      label: "   Sales Salesperson Name"
    }
    dimension: harvest_project_id {
      group_label: "Related Sales Deal"
      primary_key: yes
      label: "   Sales Harvest Project ID"
    }
    measure: services_all_deals_total_amount {
      group_label: "Related Sales Deal"

      label: "Deal Total Amount"
      description: "Sum of total amount for all deals"
      value_format_name: gbp
      type: sum
    }
  }
