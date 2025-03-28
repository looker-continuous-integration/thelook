include: "thelook.model"

test: orders_count_for_all_time_should_be_greater_than_zero {
  explore_source: orders {
    column: count {
      field: orders.count
    }
    column: status {
      field: orders.status
    }
  }
  assert: count_all_time_greater_than_zero {
    expression: ${orders.count} > 0 ;;
  }
}

test: orders_count_by_pending_status_should_be_small {
  explore_source: orders {
    column: count {
      field: orders.count
    }
    column: status {
      field: orders.status
    }
    filters: [orders.status: "PENDING"]
  }
  assert: count_all_time_greater_than_zero {
    expression: ${orders.count} < 5 ;;
  }
}
