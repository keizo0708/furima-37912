class Order < ApplicationRecord
  belongs_to :user
  belongs_tp :item

  validates :user, :item, presence: true
end
