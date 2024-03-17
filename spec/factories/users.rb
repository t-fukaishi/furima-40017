FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {Faker::Internet.email}
    password {'a12345'}
    password_confirmation {password}
    last_name {'佐藤'}
    first_name {'太郎'}
    last_name_kana {'サトウ'}
    first_name_kana {'タロウ'}
    birthday { '1990-01-01' }
  end
end