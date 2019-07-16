# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "laury@lafrenchpousse.com", first_name: "Laury", last_name: "Meredith", photo: "image/upload/v1563213725/ogitj3jijuc8ejfpwhr4.png", town: nil, latitude: 50.5672807, longitude: 2.7848217, address: "13 Rue du Bas Chemin, Lorgies, Hauts-de-France, Fr...", password: "patati")

Category.create(name: "Fruits & Légumes", icon: 'fruits_et_legumes.png')
Category.create(name: "Miel", icon: 'miel.png')
Category.create(name: "Vin", icon: 'vin.png')
Category.create(name: "Lait", icon: 'lait.png')
Category.create(name: "Fromage", icon: 'fromage.png')
Category.create(name: "Viande", icon: 'viande.png')

