FROM rust:1.77.2

WORKDIR /home/webapp

COPY Cargo.toml Cargo.toml
RUN mkdir src \
    && echo "fn main(){}" > src/main.rs \
    && cargo build --release

COPY static static
COPY .sqlx .sqlx
COPY src src
# 差分があることを検知させるために/deps/private_is_rust*を削除
RUN rm -f target/release/deps/private_is_rust* && cargo build --release
CMD ./target/release/private-is-rust
