# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Rails initialization

$ bundle install

## Database initialization

$ sudo -u postgres psql

CREATE USER social_network WITH PASSWORD '1234';
ALTER USER social_network CREATEDB;

$ bin/rails db:create db:migrate

## Rails start

$ bin/rails s
* ...
