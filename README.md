# private-isu Rust実装

[private-isu](https://github.com/catatsuy/private-isu)にRust実装を追加するためのリポジトリです．  
現状，Docker Composeのみ対応しています．  

## Using

Rustで起動するためには以下の手順が必要です．

1. private-isuの[README.md](https://github.com/catatsuy/private-isu/blob/master/README.md#docker-compose)に従って，MySQLに初期データをimportする．
2. private-isuのwebappに本リポジトリを追加する．
    ```sh
    cd webapp
    git clone https://github.com/Romira915/private-isu-rust.git rust
    ```
3. `webapp/docker-compose.yml`のapp.buildを`rust`に変更する． 
4. 起動する．
    ```sh
    cd webapp
    docker compose up
    ```
5. (Option) ローカルでビルドする場合は以下を実行する．これは使用しているcrateの`sqlx`がビルド時にクエリをチェックするためです．
```sh
cd webapp/rust
echo 'DATABASE_URL=mysql://root:root@localhost:3306/isuconp' > .env
# データベースのカラム等を変更した場合
cargo sqlx prepare
```
