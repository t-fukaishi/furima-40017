class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id

  with_options presence: true do
      validates :postal_code
      validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/}
      validates :prefecture_id , numericality: { greater_than: 0, only_integer: true}
      validates :city
      validates :house_number
      validates :phone_numbe
      validates :phone_number, format:  length: { minimum: 10 }
      validates :phone_number, format: { with: /\A\d+\z/ }
      validates :user_id
  end
  

  def save
  
    buyer = Buyer.create(postalcode: postalcode,city: city,house_number: house_number,building_name: building_name,phone_number: phone_number,purchase: purchase)

    Purchase.create(user_id: user_id, item_id: item_id)
  end

end