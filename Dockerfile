# 1. ベースイメージとしてNode.jsを使用
FROM node:20.17.0 AS build

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストールするために、package.jsonとpackage-lock.jsonをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# ソースコードをコピー
COPY . .

# Svelteアプリケーションをビルド
RUN npm run build

# 2. 実行ステージ: Node.jsサーバーでアプリを起動する
FROM node:20.17.0-alpine

# 作業ディレクトリを設定
WORKDIR /app

# 実行ステージではビルド済みファイルと依存関係だけをコピー
COPY --from=build /app ./

# アプリケーションを起動するためのスクリプト
CMD ["npm", "run", "start"]
