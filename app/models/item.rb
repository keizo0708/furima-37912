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
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上3枚以下にしてください" }

  PRICE_REGEX = /\A\d+\Z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'は半角で入力してください'
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :charge_id, :county_id, :day_id,
            numericality: { other_than: 1, message: "を選択してください" }
end
