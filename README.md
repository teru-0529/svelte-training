# svelte-training

実践Svelte入門(Svelte編)

## premise

* nodeのインストール

  ```bat
  # Versions check
  $ volta --version
  $ node -v
  $ npm -v
  ```

* githubのページ作成

## install and settings

* git clone
* `settings.code-workspace`の生成
* Svelteのセットアップ

  ```bat
  # Create from vite
  $ npm create vite@latest . -- --template svelte-ts

  # install
  $ npm install
  ```

* `index.html`の修正

  ```diff
  `#index.html`
   - <html lang="en">
   + <html lang="jp">
  ```

* 稼働確認

  ```bat
  # run dev
  $ npm run dev
  ```

* `Dockerfile`作成
* .`dockerignore`作成
* `package.json`にサーバースクリプトを追加
  * sirv-cli を使ってbuildによりdistに作成された静的ファイルをサーブ
  * すべてのネットワークインターフェースからアクセスできるように設定

  ```diff
  `#package.json`
     "scripts": {
       "build": "rollup -c",
       "dev": "rollup -c -w",
   +    "start": "sirv dist --no-clear --single --host 0.0.0.0"
    }
  ```

* `sirv-cli`インストール

  ```bat
  # install
  $ npm install sirv-cli --save
  ```

* githubのラベル設定
  * トークンの設定
* `release.yaml`の作成

## usege

### ソースコード実行(ローカル・ホットリロード)

* サーバー実行

  ```bat
  # run dev
  $ npm run dev
  ```

* アクセス
    http://localhost:5173/

### コンテナ実行確認(ローカル)

* コンテナbuild/run

  ```bat
  # container build
  $ docker build -t {IMAGE_NAME} .

  # container run
  $ docker run -p 3000:8080 {IMAGE_NAME}
  ```

* アクセス
    http://localhost:3000/

## appendix

* [【Svelte + Typescript + SPA】Svelteでルーティングを試す](https://qiita.com/k_rana/items/092957035bb75ef00210)
