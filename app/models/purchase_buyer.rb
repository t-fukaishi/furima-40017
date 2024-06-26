class PurchaseBuyer
 include ActiveModel::Model
  attr_accessor :token, :postalcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id
  with_options presence: true do
      validates :postalcode, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
      validates :prefecture_id , numericality: { greater_than: 0, only_integer: true, message: "can't be blank"}
      validates :city
      validates :house_number
      validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be a number without hyphen and within 10 to 11 characters' }
      validates :user_id
      validates :item_id
      validates :token
  end
  
  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Buyer.create!(postalcode: postalcode, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end