# README

Este Proyecto podra encontrarlo no terminado pero funcional en https://entrenamiento-eficiente.herokuapp.com
Faltaria agregar un Mailer y Arreglar el UI/UX

* Actualizacion  2021
Se agrego .ruby-version para intentar depurar los problemas
Actualmente tiene problemas con la actualizacion de las gemas que rompen el programa principalmente Sassc

## Requisitos Basicos

* Ruby version 2.7.2
* Rails version 5.1.5
* Bundle 1.17.3
* NodeJS y Yarn

## Correr Programa

* Clonar repositorio correspondiente

```bash
git clone git@github.com:FelipeMahana/TituloV1.git
```

* Installar todas las dependencias

```bash
bundle install
```

* Crear bd y migrar schema

```bash
rake db:create
rake db:migrate
```

* Installar dependencias de javascript

```bash
yarn install
```

* Ahora, correr aplicacion

```bash
rails s
```

