# Dockerfile
FROM ruby:3.1
 
# Node.js と Yarn をインストール
RUN apt-get update -qq && apt-get install -y nodejs yarn
 
# 作業ディレクトリを作成
WORKDIR /myapp
 
# Gemfile と Gemfile.lock をコピーして、Gemのインストールを実行
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install
 
# プロジェクトファイルをコンテナにコピー
COPY . /myapp
 
# ポート3000を公開
EXPOSE 3000
 
# サーバーを起動
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
