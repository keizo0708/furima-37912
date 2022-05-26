class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :county
  belongs_to :day

  belongs_to :user
  has_one :order
  has_many_attached :images

  validates :name, presence: true
  validates :content, presence: true
  validates :images, presence: true

  PRICE_REGEX = /\A\d+\Z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'is invalid. Input half-width characters'
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :charge_id, :county_id, :day_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
