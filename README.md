# README

# アプリケーション名  
YourBookShelf
# アプリケーション概要  
"YourBookShelf"は本を管理するアプリです。
# URL
https://
# テスト用アカウント  
Email: test1@test.com
Pass:zaq123
# 利用方法  
新規会員登録→ログイン→本を登録する
# 目指した課題解決  
単に管理するだけでなく本棚の見た目をしていることで、自身が所持している本を楽しく閲覧できます。
本を購入する人は、本棚に並ぶ様子も楽しみの一つだと思います。
その本棚をいつでもアプリで見れることや本の購入履歴や読書記録を同時に楽しく行えることが読書を趣味としている人にとって望まれるアプリだとの思いから作成しました。
# 要件定義
| 機能 | 目的 | 詳細 | ストーリー |
| ------------- | ---------- | ----------- | -------------- |
| 新規会員登録機能 | 新規会員登録をする為 | 新規会員を登録する | プロフィールを入力して登録する |
| ログイン機能 | ユーザーがログインする為 | ユーザーのログイン| ニックネーム、パスワードを登録してログインする |
| マイページ機能 | ユーザー自身の情報を確認する為 | ログインしたユーザーのユーザー情報 | プロフィールの確認、編集等をする |
| 検索機能 | 気になる本を検索する為 | 本を検索(キーワード) | キーワードなどを入力して特定の著者の作品を検索する |
| コメント機能 | 他ユーザーとのやりとりをする為 | ユーザー同士のメッセージ送受信 | 他ユーザーの感想に対してコメントを残す |
| いいね機能 | ユーザー同士が評価する為 | いいねボタンを設置 | ユーザー同士がいいねをして意思表示する |
# 実装した機能
 新規会員登録機能,ログイン機能,マイページ機能
# 実装予定機能
 検索機能,コメント機能,いいね機能

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
