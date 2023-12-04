class Entry < ApplicationRecord
  scope :least_entries,
        lambda { |middle_day|
          where('reserved_date <= ?', middle_day.to_date + 7.days)
            .and(where('reserved_date >= ?', middle_day.to_date - 7.days))
        }
end
