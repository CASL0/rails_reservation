# HowToRails

- [HowToRails](#howtorails)
  - [各種ファイルの生成](#各種ファイルの生成)
  - [モデルの生成](#モデルの生成)
  - [Rails コンソールでインスタンスメソッドを確認する](#rails-コンソールでインスタンスメソッドを確認する)
  - [TODO コメントの一覧を確認する](#todo-コメントの一覧を確認する)
  - [ソースの行数を確認する](#ソースの行数を確認する)
  - [where 句の SQL インジェクション対策](#where-句の-sql-インジェクション対策)
  - [where 句を or で連結する](#where-句を-or-で連結する)
  - [モデルのバリデーション](#モデルのバリデーション)
  - [モデルの正規化（Rails 7.1+）](#モデルの正規化rails-71)
  - [よく利用する検索条件のメソッドを用意する](#よく利用する検索条件のメソッドを用意する)
  - [ルート（/）のアクションを指定する](#ルートのアクションを指定する)
  - [コントローラーとは別のパス表示を設定する](#コントローラーとは別のパス表示を設定する)

Ruby on Rails の HowTo をまとめます。

## 各種ファイルの生成

MVC に乗っ取った各種ファイルを`scaffold`コマンドで生成します。

```sh
rails g scaffold book title:string description:text
```

上記のコマンドで以下のファイルが生成されます。

- コントローラー
- モデル
- 各アクション用の erb
- マイグレーションファイル
- ルーターの設定追加

## モデルの生成

`model`コマンドでモデル関連ファイルを生成します。

```sh
rails g model user name:string address:string email:string birthday:date
```

上記のコマンドで以下のファイルが生成されます。

- モデル
- マイグレーションファイル

## Rails コンソールでインスタンスメソッドを確認する

```sh
rails c
book = Book.new
book.methods
```

## TODO コメントの一覧を確認する

```sh
rails notes
```

## ソースの行数を確認する

```sh
rails stats
```

## where 句の SQL インジェクション対策

プレースホルダー（?）を使用する。

```ruby
User.where("name = ? and birthday > ?", name, date)
```

## where 句を or で連結する

```ruby
User.where(address: "東京都港区").or(User.where(address: "東京都品川区"))
# User.where(address: ["東京都港区", "東京都品川区"])と同義
```

## モデルのバリデーション

```ruby
validates :name, format: { with: /\A.+#\d{2}\z/, message: '会議室名が正しくありません' }
```

## モデルの正規化（Rails 7.1+）

save の時に正規化する。

```ruby
# 前後のblankを除去
normalizes :name, with: ->(name) { name.strip }
```

## よく利用する検索条件のメソッドを用意する

```ruby
scope :least_entries,
        lambda { |middle_day|
          where('reserved_date <= ?', middle_day.to_date + 7.days)
        }
```

## ルート（/）のアクションを指定する

```ruby
root to: 'users#index'
```

## コントローラーとは別のパス表示を設定する

```ruby
resources :entries, path: :rentals
```
