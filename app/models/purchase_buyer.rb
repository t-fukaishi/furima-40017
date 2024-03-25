class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id

  with_options presence: true do
    validates :postalcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, presence: true
    validates :house_number, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
  
    buyer = Buyer.create(postalcode: postalcode,city: city,house_number: house_number,building_name: building_name,phone_number: phone_number,purchase: purchase)

    Purchase.create(user_id: user_id, item_id: item_id)
  end

end