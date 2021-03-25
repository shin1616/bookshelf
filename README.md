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

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_day          | date   | null: false               |
| gender             | string | null: false               |


### Association

- has_many :books



## books テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| author    | string     | null: false, unique: true      |
| publisher | string     | null: false                    |
| price     | integer    | null: false                    |
| text      | text       | null: false                    |
| date      | date       | null: false                    |
| star_id   | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :book_tag_relations
- has_many :tags, through: :book_tag_relations



## tags テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |

### Association

- has_many :book_tag_relations
- has_many :books, through: :book_tag_relations


## book_tag_relations テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| book_id   | references | null: false, foreign_key: true |
| tag_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :books
- belongs_to :tags
