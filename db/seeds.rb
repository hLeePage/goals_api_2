# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first: 'Kermit',
            last: 'Frog',
            username: 'Kermit',
            email: 'kermit@frog.com',
            password: 'password')

User.create(first: 'Miss',
            last: 'Piggy',
            username: 'Miss',
            email: 'miss@piggy.com',
            password: 'password')

User.create(first: "Fozzy",
            last: "Bear",
            username: "Fozzy",
            email: "fozzy@bear.com",
            password: 'password')
