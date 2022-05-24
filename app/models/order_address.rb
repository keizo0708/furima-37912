class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :county_id, :city, :address, :building, :tell, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :tell, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid.' }
  end
  validates :county_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, county_id: county_id, city: city, address: address, building: building, tell: tell,
                   order_id: order.id)
  end
end
