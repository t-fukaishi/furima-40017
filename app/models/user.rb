class User < ApplicationRecord
  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX
validates :nickname, presence: true
validates :birthday, presence: true
validates :last_name,presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
validates :first_name, presence: true,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
validates :last_name_kana,presence: true, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
validates :first_name_kana, presence: true,format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

# ・ニックネームが必須であること。
# ・生年月日が必須であること。"							
# ・お名前(全角)は、名字と名前がそれぞれ必須であること。"					
# ・お名前カナ(全角)は、名字と名前がそれぞれ必須であること。"					
# ・お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。"					
# # ・お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。"			
# https://master.tech-camp.in/v2/curriculums/8134		