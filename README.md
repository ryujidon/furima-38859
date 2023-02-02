

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


## items テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| title              | string | null: false  |
| price              | integer | null: false |
| explanation           | text | null: false  |
| category_id           | integer | null: false |
| item_state_id         | integer | null: false |
| delivery_charge_id    | integer | null: false |
| place_id              | integer | null: false |
| delivery_date_id      | integer | null: false |
| user                | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  has_one :buy



## buys テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user               | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to :user
  has_one :delivery

## deliveries テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| postal_code        | string | null: false  |
| place_id         | integer | null: false |
| city               | string | null: false |
| address            | string | null: false  |
| building_name      | string | |
| telephone          | string | null: false |
| buy                | references | null: false, foreign_key: true |

### Association
  belongs_to :buy



