# private-isu Rust実装

[private-isu](https://github.com/catatsuy/private-isu)にRust実装を追加するためのリポジトリです．  
現状，Docker Composeのみ対応しています．  

## Using

Rustで起動するためには以下の手順が必要です．

1. private-isuのwebappに本リポジトリを追加する．

```sh
cd private-isu/webapp
git clone https://github.com/Romira915/private-isu-rust.git rust
```

2. `webapp/docker-compose.yml`のapp.buildを`rust`に変更する．

3. `webapp/docker-compose.yml`のappとmysqlに以下を追加する．これは使用しているcrateの`sqlx`がビルド時にデータベースにアクセス可能な状態である必要があるからです．

```webapp/docker-compose.yml
app:
  depends_on:
     mysql:
       condition: service_healthy
       
mysql:
  healthcheck:
    test: mysqladmin ping -h 127.0.0.1 -u$$MYSQL_USER -p$$MYSQL_PASSWORD
    interval: 5s
    timeout: 5s
    retries: 10
    start_period: 5s
```

4. private-isuの[README.md](https://github.com/catatsuy/private-isu/blob/master/README.md)のDocker Composeの起動方法に従って実行してください．

