

## users テーブル

| Column                  | Type   | Options                   |
| ------------------      | ------ | ------------------------- |
| nickname                | string | null: false |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false |
| first_name              | string | null: false |
| last_name               | string | null: false |
| first_name_kana         | string | null: false |
| last_name_kana           | string | null: false |
| birthday                | date   | null: false |


### Association
  has_many :items
  has_many :buys
  has_many :deliverys


## items テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| title              | string | null: false  |
| price              | integer | null: false |
| postage_id            | string | null: false  |
| category_id         | integer | null: false |
| item_state_id         | string | null: false |
| place_id            | string | null: false |
| delivery_date_id      | string | null: false |
| user               | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  has_one :buy
  has_one :delivery



## buys テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user               | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |
| delivery          | references  | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to :user
  has_one :delivery

## delivery テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| postal_code        | string | null: false  |
| place_id         | string | null: false |
| city               | string | null: false |
| address            | string | null: false  |
| building_name      | string | |
| telephone          | string | null: false |
| user               | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to :user
  belongs_to :buy

