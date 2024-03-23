class User < ApplicationRecord
  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
