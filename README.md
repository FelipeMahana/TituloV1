# README

Este Proyecto podra encontrarlo no terminado pero funcional en https://entrenamiento-eficiente.herokuapp.com  
Faltaria agregar un Mailer y Arreglar el UI/UX

* Actualizacion  2021  
Se agrego .ruby-version para intentar depurar los problemas.

## Requisitos Básicos Iniciales

* Ruby version 2.7.2
* Rails version 5.1.5
* Bundler 1.17.3
* NodeJS y Yarn

## Requerimientos Esperados

* Ruby version 2.7.2
* Rails version 5.2.4 o superior
* Bundler 1.17.3
* NodeJS y Yarn

## Correr Programa

* Clonar repositorio correspondiente

```
git clone git@github.com:FelipeMahana/TituloV1.git
```

* Installar todas las dependencias

```
bundle install
```

* Crear bd y migrar schema

```
rake db:create
rake db:migrate
```

* Por error mio, hay que correr el seed (eliminare esto una vez arreglado)

```
rake db:seed
```

* Installar dependencias de javascript

```
yarn install
```

* Ahora, correr aplicacion

```
rails s
```

