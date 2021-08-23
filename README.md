# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :bought_logs


## bought_users テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_code    | string    | null: false                    |
| area_id        | integer   | null: false                    |
| municipalities | string    | null: false                    |
| address        | string    | null: false                    |
| building       | string    |                                |
| phone_number   | string    | null: false                    |

### Association

- belongs_to :bought_log


## bought_logs テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| item_id        | reference | null: false, foreign_key: true |
| user_id        | reference | null: false, foreign_key: true |
| bought_user_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :bought_user


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| item_name          | string    | null: false                    |
| text               | text      | null: false                    |
| category_id        | integer   | null: false                    |
| status_id          | integer   | null: false                    |
| cost_id            | integer   | null: false                    |
| area_id            | integer   | null: false                    |
| days_id            | integer   | null: false                    |
| price              | integer   | null: false                    |
| user_id            | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :bought_log
- has_many   :comments


## commentsテーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| text    | text      | null: false                    |
| item_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :item