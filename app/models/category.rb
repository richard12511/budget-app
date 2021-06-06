class Category < ApplicationRecord
  belongs_to :user
  has_many :debits
  validates :user_id, presence: true
  validates :category_name, presence: true
end
