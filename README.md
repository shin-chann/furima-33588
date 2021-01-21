# furimaのER図

## usersテーブル

| Column          | Type   | options     |
| --------------- | ------ | ----------  |
| email           | string | null: false |
| password        | string | null: false |
| name            | string | null: false |
| first_name_cc   | string | null: false |
| last_name_cc    | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :purchase
- belongs_to :residence

# items

| Column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| explanation     | string     | null: false                    |
| category        | string     | null: false                    |
| state           | string     | null: false                    |
| burden          | string     | null: false                    |
| area            | string     | null: false                    |
| number_of_times | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase

# purchase

| user  | references | null: false, foreign_key: true |
| items | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :residence

# residence

| Column     | Type       | options                        |
| -----------| ---------- | ------------------------------ |
| postal     | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     | null: false                    |
| phon       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |


### Association

- has_many :user
- belongs_to :purchase
