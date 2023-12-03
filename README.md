# rails_devcontainer_template

Rails の DevContainer 用テンプレート

## Getting Started

1. コマンドパレット（Ctrl+Shift+P）から[Open Folder in Container]を選択し、DevContainer で開きます。
1. rails をインストールします。

   `gem install rails`

1. 以下のコマンドを実行し、プロジェクトを作成します。

   `rails new .`

1. `config/database.yml`に DB の設定値を投入します。

```yml
username: <%= ENV['DATABASE_USER'] %>
password: <%= ENV['DATABASE_PASSWORD'] %>
host: <%= ENV['DATABASE_HOST'] %>
```
