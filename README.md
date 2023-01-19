

## users テーブル

| Column                  | Type   | Options                   |
| ------------------      | ------ | ------------------------- |
| nickname                | string | null: false |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false |
| name                    | string | null: false |
| name_kana               | string | null: false |
| birthday                | text   | null: false |


### Association
- has_many :items
  has_one :buys


## items テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| title              | string | null: false  |
| prise              | string | null: false |
| postage            | string | null: false  |
| category           | string | null: false |
| item_state         | string | null: false |
| place              | string | null: false |
| time               | string | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
  has_one :buys


## buys テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| postal_code        | string | null: false  |
| buys_state         | string | null: false |
| city               | string | null: false |
| address            | string | null: false  |
| building_name      | string | null: false |
| telephone          | string | null: false |
| user               | references  | null: false, foreign_key: true |
| items              | references  | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :user