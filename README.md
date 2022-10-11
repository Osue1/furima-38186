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


# usersテーブル

| Column                  | Type        | Options                   |
|-------------------------|-------------|---------------------------|
| nickname                | string      | null: false               |
| email                   | string      | null: false, unique: true |
| encrypted_password      | string      | null: false               |
| last_name               | string      | null: false               |
| first_name              | string      | null: false               |
| last_name_reading       | string      | null: false               |
| first_name_reading      | string      | null: false               |
| birthday                | integer     | null: false               |

### Association
  has_many :products
  has_many :purchase_records


# productsテーブル

| Column          | Type         | Options                   |
|-----------------|--------------|---------------------------|
| image           | blob         | null: false               |
| name            | string       | null: false               |
| text            | string       | null: false               |
| category        | string       | null: false               |
| status          | string       | null: false               |
| postage         | integer      | null: false               |
| sender_address  | string       | null: false               |
| days_to_ship    | integer      | null: false               |
| price           | integer      | null: false               |
| user            | references   | null: false, foreign_key  |

### Association
  belongs_to :user
  has_one :purchase_record


# purchase_recordsテーブル

| Column              | Type        | Options                   |
|---------------------|-------------|---------------------------|
| user                | references  | null: false, foreign_key  |
| product             | references  | null: false, foreign_key  |
| shipping_addresses  | references  | null: false, foreign_key  |

### Association
  belongs_to :user
  belongs_to :product
  has_one :shipping_address


# shipping_addressesテーブル

|Column         | Type    | Options     |
|---------------|---------|-------------|
| post_code     | string  |null: false  |
| prefectures   | string  |null: false  |
| city          | string  |null: false  |
| address       | string  |null: false  |
| building      | string  |             |
| phone_number  | string  |null: false  |

### Association
  belongs_to :purchase_record