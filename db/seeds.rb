# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# もしもdeviseでadminユーザのデフォルト値が使いたくなったら、以下のコメントアウトを解除
EMAIL = Rails.application.credentials.admin[:email]
PASSWORD = Rails.application.credentials.admin[:password]

admins = Admin.new(:email => EMAIL, :password => PASSWORD)
admins.save!

