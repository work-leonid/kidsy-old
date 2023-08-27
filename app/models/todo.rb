class Todo < ApplicationRecord
  enum status: {
    incomplete: 0,
    complete: 1
  }

  scope :sorted_by_due_date, -> {
    order(Arel.sql("CASE WHEN due_date IS NULL THEN 1 ELSE 0 END, due_date ASC"))
  }
end
