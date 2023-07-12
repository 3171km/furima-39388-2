# README

## users_テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| sur_name           | string | null: false               |
| name               | string | null: false               |
| sur_name_katakana  | string | null: false               |
| name_katakana      | string | null: false               |
| birth_day          | date   | null: false               |

## Association
has_many :items
has_many :buyers

## items_テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| overview           | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| burden_id          | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| shipment_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
belongs_to  :user
has_one    :buyer

## buyers_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
belongs_to  :user
belongs_to  :item
has_one     :shipping

## shippings_テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | string     | null: false                    |
| region_id          | integer    | null: false                    |
| city               | string     | null: false                    |
| address1           | string     | null: false                    |
| address2           | string     |                                |
| telephone          | string     | null: false                    |
| buyer              | references | null: false, foreign_key: true |

## Association
belongs_to  :buyer
