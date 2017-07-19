# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.destroy_all
Product.destroy_all

c1 = Category.create(name: "Celulares", disc: 10)
c2 = Category.create(name: "Computadores", disc: 50)
c3 = Category.create(name: "Televisores", disc: 25)

pro_c1 = Product.create(name: "Iphone 7", price: 550000, category: c1)
pro_c2 = Product.create(name: "Computer", price: 250000, category_id: c2.id)
pro_c3 = c3.products.build(name: "TV 1", price: 350000).save
pro2_c3 = c3.products.build(name: "TV 2", price: 400000).save

newpro_c1 = Product.create(name: "Samsung S8", price: 650000, category: c1)
newpro_c2 = Product.create(name: "Notebook", price: 380000, category_id: c2.id)
newpro_c3 = c3.products.build(name: "Smart TV", price: 350000).save
newpro2_c3 = c3.products.build(name: "Led 4k", price: 600000).save

Product.last.destroy

producto = Product.last
producto.update(premium: true)
producto.save

Category.all.each { |element| element.name.upcase!; element.save }

