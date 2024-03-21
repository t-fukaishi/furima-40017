class Item < ApplicationRecord
  has_one_attached :image
  # has_one :purchase
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_payment
  belongs_to :prefecture
  belongs_to :delivery_duration

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_payment_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, numericality: { only_integer: true }


end
