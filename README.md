# furimaのER図

## usersテーブル

| Column              | Type   | options                   |
| ------------------- | ------ | ------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| name                | string | null: false               |
| first_name_cc       | string | null: false               |
| last_name_cc        | string | null: false               |
| first_name_kana     | string | null: false               |
| last_name_kana      | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

# items

| Column            | Type       | options                        |
| ----------------- | ---------- | ------------------------------ |
| product_name      | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| state_id          | integer    | null: false                    |
| burden_id         | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| number_of_time_id | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase

# purchases

| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :residence

# residences

| Column     | Type       | options                        |
| -----------| ---------- | ------------------------------ |
| postal     | string     | null: false                    |
| area_id    | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
| purchase   | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
