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
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_one  :buy_user


## buy_users テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_code    | integer   | null: false                    |
| prefectures    | string    | null: false                    |
| municipalities | string    | null: false                    |
| address        | string    | null: false                    |
| building       | string    |                                |
| phone_number   | integer   | null: false                    |
| user_id        | reference | null: false, foreign_key: true |

### Association

- belongs_to :user


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| image_id           | reference | null: false, foreign_key: true |
| item_name          | string    | null: false                    |
| text               | text      | null: false                    |
| category_id        | reference | null: false, foreign_key: true |
| status_id          | reference | null: false, foreign_key: true |
| cost_id            | reference | null: false, foreign_key: true |
| start_area_id      | reference | null: false, foreign_key: true |
| days_id            | reference | null: false, foreign_key: true |
| price              | integer   | null: false                    |
| user_id            | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments


## commentsテーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| text   | text      | null: false                    |
| item_id| reference | null: false, foreign_key: true |

### Association

- belongs_to :item