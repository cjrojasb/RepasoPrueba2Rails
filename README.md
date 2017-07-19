# README

Heroku App: https://taller2railsheroku.herokuapp.com/

Taller Preparación Prueba N°2 Rails

Desarrollo:

Parte Backend

1. rails new Tienda -d postgresql
    git checkout -b development

2. rails g model Category name:string
   rails g model Product name:string price:integer category:references

3. rake diagram:all

4. product.rb -> validates :price, presence: true

5. rails console -> Product.create(name: "Mouse", price: 100)   (0.1ms)  BEGIN
                    (0.1ms)  ROLLBACK

6. rails g migration addPremiumToProduct premium:boolean  
   product.rb ->   before_save :add_columFalse
                    def add_columFalse
                      if self.premium.nil?
                        self.premium = false
                      end
                    end

7. -> seeds.rb 

        Category.destroy_all

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


Parte Backend Avanzado

1. git checkout -b backend

2. scope :scopePremium, -> {where(premium: true)}

3. scope :last_n, (->(n) { order(:id).limit(n) })

4. dependent: :destroy

5. -> product.rb

      after_destroy :check_last

      def check_last
        category.destroy unless category.products.any?
      end


6. rails g migration addDiscToCategory disc:integer

  -> category.rb
    
     validates :disc, :inclusion => {:in => 0..100}
 
7. -> product.rb 
  
      def price_final
       self.price*(100 - self.category.disc)/100
      end


Parte Front-end

1. git checkout -b frontend

2. rails g controller products index

3. <% @productos.each do |element| %>
    <li><%= element.name %></li>
   <% end %>


Deployment

1. heroku create taller2railsheroku

2. git push heroku master

3. heroku run rake db:migrate

4. heroku run rake db:seed

5. heroku open