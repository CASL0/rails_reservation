class Room < ApplicationRecord
  validates :name, :place, :number, presence: true
  validates :name, length: { maximum: 30 }
  validates :place, inclusion: { in: ["東京", "大阪", "福岡", "札幌", "仙台", "名古屋", "金沢"] }
  validates :number, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 30 }
  validates :name, format: { with: /\A.+#\d{2}\z/ }
end
