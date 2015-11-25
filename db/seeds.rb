# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([{ title: 'מנהל'}, { title: 'תורן'}])

cities = City.create([{ name: 'הוד השרון' },{ name: 'כפר סבא' },{ name: 'רעננה' },{ name: 'הרצליה' },{ name: 'רמת השרון' },{ name: 'תל אביב' },{ name: 'רמת גן' },{ name: 'גבעתיים' },{ name: 'פתח תקווה' },{ name: 'חולון' },{ name: 'בת ים' },{ name: 'ראשון לציון' }])

customers_types = CustomersType.create([{name: 'רגיל'}, {name: 'זהב'}])