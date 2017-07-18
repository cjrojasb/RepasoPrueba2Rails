# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.destroy_all
Product.destroy_all

c1 = Category.create(name: "Celulares")
c2 = Category.create(name: "Computadores")
c3 = Category.create(name: "Televisores")

pro_c1 = Product.create(name: "Cell 1", price: 100, category: c1)
pro_c2 = Product.create(name: "Computer 1", price: 100, category_id: c2.id)
pro_c3 = c3.products.build(name: "TV 1", price: 100).save
pro2_c3 = c3.products.build(name: "TV 2", price: 100).save

Product.last.destroy

producto = Product.last
producto.update(premium: true)
producto.save

Category.all.each { |element| element.name.upcase!; element.save }

