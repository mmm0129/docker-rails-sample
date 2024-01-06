# コンテナイメージ
FROM ruby:2.7.6
# ライブラリのインストール
RUN apt-get update && apt-get install -y \
build-essential \
libpq-dev \
tzdata \                                             
nodejs \
default-mysql-client \
yarn \
vim \
cron
# タイムゾーンの設定
ENV TZ Asia/Tokyo
# 作業ディレクトリの設定
WORKDIR /docker-rails-sample
# ローカルからGemfileとGemfile.lockをwebコンテナの/docker-rails-sample/にコピー
COPY Gemfile Gemfile.lock /docker-rails-sample/
# ホストルートディレクトリをwebコンテナ /docker-rails-sampleとして追加
ADD . /docker-rails-sample
# bundleインストールを実行
RUN bundle install