# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contact = Contact.find(1)
contact.user_id = 1
contact.save

contact = Contact.find(2)
contact.user_id = 1
contact.save

contact = Contact.find(3)
contact.user_id = 1
contact.save