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
Billing.destroy_all
Program.destroy_all
Result.destroy_all


### ~~~~Creacion Planes~~~~ ###
#~Necesario creacion los planes de entrenamiento, estos deben contener datos estaticos, en caso de actualizar precios, el seed debe ser cambiado~#
#Plan.create(price: (precio del plan), duration: (duracion en meses del plan), contract_type: ((valor de 1 a 3), describe si el plan es rutina entrenamiento, plan nutricional o ambos), description: (Descripcion del plan a contratar(en que consiste)))

#plan 1 mes entrenamiento solo
plan1 = Plan.create(price: 60, duration: 1, contract_type: 1, description: Faker::Lorem.paragraph)

#plan 1 mes nutricion sola
plan2 = Plan.create(price: 60, duration: 1, contract_type: 2, description: Faker::Lorem.paragraph)
#plan 1 mes entrenamiento y nutricion

plan3 = Plan.create(price: 110, duration: 1, contract_type: 3, description: Faker::Lorem.paragraph)

#plan 3 meses entrenamiento solo
plan4 = Plan.create(price: 160, duration: 3, contract_type: 1, description: Faker::Lorem.paragraph)

#plan 3 meses nutricion  sola
plan5 = Plan.create(price: 160, duration: 3, contract_type: 2, description: Faker::Lorem.paragraph)

#plan 3 meses entrenamiento y nutricion
plan6 = Plan.create(price: 300, duration: 3, contract_type: 3, description: Faker::Lorem.paragraph)

###Creacion de usuario profesor###
User.create(name: "entrenador1", email: "entrenador1@gmail.com", password: "123123", role: 'admin')
User.create(name: "entrenador2", email: "entrenador2@gmail.com", password: "123123", role: 'admin')

### ~~~~Creacion contenido generico contrato~~~~ ###
fecha = DateTime.now

15.times do |i|
	usuario = User.create(name: "usuario#{i}", email: "usuario#{i}@gmail.com", password: "123123")
	12.times do |j|
		result = Result.create(date: (fecha << j), hundred_mts: rand(10..20), two_hundred_mts: rand(19..40), three_hundred_mts: rand(37..55), four_hundred_mts: rand(46..60), eight_hundred_mts: rand(100..120),thousand_mts: rand(120..150), thousand_five_hundred_mts: rand(260..300), cooper_test: rand(1000..3000), squat_rm: rand(100..200), user: usuario)
	end
	contrato = Contract.create(weight: rand(30..150), height: rand(60..230), activity_level: rand(1..5),goal: Faker::Lorem.paragraph, disease: Faker::Lorem.word, allergies: Faker::Lorem.word, bmr: rand(2000..3000), age: rand(10..100), sex:rand(1..2), pending: true, user: usuario, plan: plan3)

end
