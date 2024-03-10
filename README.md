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
- has_many :buyings

## items テーブル

| Column                  | Type        | Options     |
| ------                  | ------      | ----------- |
| name                    | string      | null: false |
| description             | text        | null: false |
| price                   | integer     | null: false |
| category_id             | integer     | null: false |
| condition_id            |  integer    | null: false |
| delivery_fee_payment_id |  integer    | null: false |
| prefecture_id           |  integer    | null: false |
| delivery_duration_id    |  integer    | null: false |
| user                    | references  | null: false, foreign_key: true | 


### Association

- has_one :buying
- belongs_to :user


## buyers テーブル
     
| Column             | Type      | Options     |
| ------             | -------   | --------    |
|postalcode          |string     | null: false |
|prefecture_id       |integer    | null: false |
|city                |string     | null: false |
|house_number        |string     | null: false |
|building_name       |string     |             |
|phone_number        |string     | null: false |
|buying              |references | null: false , foreign_key: true|


### Association

- belongs_to :buying

## buyings テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer