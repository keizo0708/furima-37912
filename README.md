## usersテーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birthday              | date    | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
 
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| content               | text       | null: false                    |
| category              | string     | null: false                    |
| condition             | string     | null: false                    |
| delivery_charge       | string     | null: false                    |
| shipping_area         | string     | null: false                    |
| days_to_ship          | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order

## ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address 

## addressesテーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| county       | text       | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| tell         | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
- belongs_to :order
