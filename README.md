PHP-FPM + MySQL + Nginx + NodeJS with Docker-Compose
==========================================================================

Initial configuration to install a web environment with the following images:

 - PHP default 8.3
 - Nginx and NodeJS as web server
 - MySQL 8 default access credentials are defined in `.env` file
 - Put the web apps into `www` folder

## Installation

### Prerequisites

- Docker 24.0
- Docker Compose 2.22

### Build and Run

1. Run `make build` to build the Docker images
2. Run `make up` to run the Docker containers

All the commands above can be run with one command:

```
make build && make up
```

As a result, the application will be available over HTTP at http://localhost/, and over HTTPS at https://localhost/.

### Stopping the Application

To stop the application, run `make down`.

### Create SSL Cert.
```
# 設定ファイルのフォルダに移動(事前にプロジェクトフォルダに移動)
cd <repo_root>/services/nginx/ssl/localhost
# RSA 暗号方式の秘密鍵を作成
openssl genrsa 2048 > localhost.key
# 作成した秘密鍵からCSR(証明書署名要求)ファイルを作成
openssl req -new -key localhost.key > localhost.csr
# 自己署名証明書(CRT)を作成
openssl x509 -days 3650 -req -sha256 -signkey localhost.key < localhost.csr > localhost.crt
# 不要なCSRファイルを削除
rm localhost.csr
```