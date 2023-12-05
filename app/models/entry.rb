class Entry < ApplicationRecord
  belongs_to :room
  scope :least_entries,
        lambda { |middle_day|
          where('reserved_date <= ?', middle_day.to_date + 7.days)
            .and(where('reserved_date >= ?', middle_day.to_date - 7.days))
        }
end
