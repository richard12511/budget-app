class Debit < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  validates :frequency, presence: true
end
