# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

Plan.destroy_all
Contract.destroy_all
User.destroy_all
Program.destroy_all
Result.destroy_all


### ~~~~Creacion Planes~~~~ ###
#~Necesario creacion los planes de entrenamiento, estos deben contener datos estaticos, en caso de actualizar precios, el seed debe ser cambiado~#
#Plan.create(price: (precio del plan), duration: (duracion en meses del plan), contract_type: ((valor de 1 a 3), describe si el plan es rutina entrenamiento, plan nutricional o ambos), description: (Descripcion del plan a contratar(en que consiste)))

#plan 1 mes entrenamiento solo
plan1 = Plan.create(price: 60, duration: 1, contract_type: 1, description: 'Permite tener acceso a un experto en entrenamiento con el cual podrás mantener contacto, este te guiara con una rutina de entrenamiento, pensada en ayudarte a lograr tus metas.')

#plan 1 mes nutricion sola
plan2 = Plan.create(price: 60, duration: 1, contract_type: 2, description: 'Permite tener acceso a un experto en nutrición con el cual podrás mantener contacto, este te guiara con un plan nutricional, pensado en ayudarte a lograr tus metas')
#plan 1 mes entrenamiento y nutricion

plan3 = Plan.create(price: 110, duration: 1, contract_type: 3, description: 'Permite tener una mezcla de los dos planes, con lo cual obtendrás una rutina de entrenamiento, acompañada de un plan nutricional, pensado en ayudarte a lograr tus metas.')

#plan 3 meses entrenamiento solo
plan4 = Plan.create(price: 160, duration: 3, contract_type: 1, description: 'Permite tener acceso a un experto en entrenamiento con el cual podrás mantener contacto, este te guiara con una rutina de entrenamiento, pensada en ayudarte a lograr tus metas.')

#plan 3 meses nutricion  sola
plan5 = Plan.create(price: 160, duration: 3, contract_type: 2, description: 'Permite tener acceso a un experto en nutrición con el cual podrás mantener contacto, este te guiara con un plan nutricional, pensado en ayudarte a lograr tus metas')

#plan 3 meses entrenamiento y nutricion
plan6 = Plan.create(price: 300, duration: 3, contract_type: 3, description: 'Permite tener una mezcla de los dos planes, con lo cual obtendrás una rutina de entrenamiento, acompañada de un plan nutricional, pensado en ayudarte a lograr tus metas.')

###Definiendo Array de categoría
categoryArray = ['100 mts', '200 mts', '400 mts', '800 mts', '1500 mts', '4 x 100 mts', '4 x 400 mts']

### ~~~~Creacion de usuario profesor~~~~ ###
entrenador1 = User.create(name: "entrenador1", email: "entrenador1@gmail.com", password: "123123", role: 'admin')
entrenador2 = User.create(name: "entrenador2", email: "entrenador2@gmail.com", password: "123123", role: 'admin')

### ~~~~Creacion contenido generico contrato~~~~ ###
fecha = DateTime.now

### ~~~~Creacion usuario inicial~~~~ ###
11.times do |i|
	usuario = User.create(name: "usuario#{i}", email: "usuario#{i}@gmail.com", password: "123123")
	12.times do |j|
		#Bueno
		result = Result.create(date: (fecha << j), hundred_mts: rand(10..16), two_hundred_mts: rand(19..35), three_hundred_mts: rand(37..50), four_hundred_mts: rand(46..55), eight_hundred_mts: rand(100..115),thousand_mts: rand(120..140), thousand_five_hundred_mts: rand(260..285), cooper_test: rand(1000..2500), squat_rm: rand(150..250), user: usuario)
		#Malo
		result = Result.create(date: (fecha << j), hundred_mts: rand(13..20), two_hundred_mts: rand(25..40), three_hundred_mts: rand(42..55), four_hundred_mts: rand(51..60), eight_hundred_mts: rand(110..120),thousand_mts: rand(131..150), thousand_five_hundred_mts: rand(273..300), cooper_test: rand(2000..3000), squat_rm: rand(100..160), user: usuario)
	end
	contrato = Contract.create(weight: rand(30..130), height: rand(60..230),goal: Faker::Lorem.paragraph, age: rand(13..70), sex:rand(1..2), pending: true, category: categoryArray.sample, user: usuario, plan: plan3)
end

### ~~~~Creacion usuario listo~~~~ ###
2.times do |i|
	usuario = User.create(name: "usuarioListo#{i}", email: "listo#{i}@gmail.com", password: "123123")
	12.times do |j|
		#Bueno
		result = Result.create(date: (fecha << j), hundred_mts: rand(10..16), two_hundred_mts: rand(19..35), three_hundred_mts: rand(37..50), four_hundred_mts: rand(46..55), eight_hundred_mts: rand(100..115),thousand_mts: rand(120..140), thousand_five_hundred_mts: rand(260..285), cooper_test: rand(1000..2500), squat_rm: rand(150..250), user: usuario)
		#Malo
		result = Result.create(date: (fecha << j), hundred_mts: rand(13..20), two_hundred_mts: rand(25..40), three_hundred_mts: rand(42..55), four_hundred_mts: rand(51..60), eight_hundred_mts: rand(110..120),thousand_mts: rand(131..150), thousand_five_hundred_mts: rand(273..300), cooper_test: rand(2000..3000), squat_rm: rand(100..160), user: usuario)
	end
	contrato = Contract.create(weight: rand(30..130), height: rand(60..230),goal: Faker::Lorem.paragraph, age: rand(13..70), sex:rand(1..2), pending: false, category: categoryArray.sample, user: usuario, plan: plan3)
	programCaducado = Program.create(coach_mail: entrenador2.email, coach_name: entrenador2.name, nutrition: Faker::Lorem.paragraph, training: Faker::Lorem.paragraph, contract: contrato)
end

### ~~~~Creacion usuario vencido~~~~ ###
usuarioCaducado = User.create(name: "caducado", email: "caducado@gmail.com", password: "123123")
contratoCaducado = Contract.create(weight: rand(30..130), height: rand(60..230),goal: Faker::Lorem.paragraph, age: rand(10..70), sex:rand(1..2), pending: false, category: categoryArray.sample, user: usuarioCaducado, plan: plan3)
entrenadorCaducado = User.create(name: "entrenador3", email: "entrenador3@gmail.com", password: "123123", role: 'admin')
programCaducado = Program.create(coach_mail: entrenadorCaducado.email, coach_name: entrenadorCaducado.name, nutrition: 'nutricion caducada',training: 'nutricion caducada' ,created_at: (fecha << 7) , contract: contratoCaducado)

### ~~~~Creacion usuario admin~~~~ ###
AdminUser.create!(email: 'admin@admin.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?
