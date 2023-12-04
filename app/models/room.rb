class Room < ApplicationRecord
  validates :name, :place, :number, presence: true
  validates :name, length: { maximum: 30 }
  validates :place, inclusion: { in: %w[東京 大阪 福岡 札幌 仙台 名古屋 金沢] }
  validates :number, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 30 }
  validates :name, format: { with: /\A.+#\d{2}\z/, message: '会議室名が正しくありません' }
  validates_each :number do |record, attr, value|
    record.errors.add(attr, '収容人数は５の倍数で指定してください') unless (value % 5).zero?
  end
end
