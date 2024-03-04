# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column               | Type    | Options     |
| ------               | ------  | ----------- |
| name                 | string  | null: false |
| description          | text    | null: false |
| price                | integer | null: false |
| category_id          | integer | null: false |
| condition            | string  | null: false |
| delivery_fee_payment | string  | null: false |
| area                 | string  | null: false |
| delivery_duration    | string  | null: false |
| user                 | string  | null: false | 


### Association


- belongs_to :user


## buyers テーブル
     
| Column       | Type   | Options     |
| ------       | -------| --------    |
|postalcode    |integer | null: false |
|prefecture    |integer | null: false |
|city          |integer | null: false |
|house_number  |integer | null: false |
|building_name |integer | null: false |
|phone_number  |integer | null: false |



### Association
- has_one  :buying
- belongs_to :buying

## buying テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :items