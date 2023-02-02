

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
  has_many :orders


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
  has_one :order



## orders テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user               | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to :user
  has_one :delivery

## send_addresses テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| postal_code        | string | null: false  |
| place_id         | integer | null: false |
| city               | string | null: false |
| address            | string | null: false  |
| building_name      | string | |
| telephone          | string | null: false |
| order                | references | null: false, foreign_key: true |

### Association
  belongs_to :order



