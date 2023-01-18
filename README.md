# Lunch and Learn

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

## Description

 Back end portion of an application that allows users to search for cuisines by country, and provide opportunity to learn more about that countries culture. Users can search for recipes by country, favorite recipes, and learn more about a particular country.

## Endpoints exposed

- Recipe Search (by country)
- Learning Resource Search (by country)
- User Create
- Favorites Create
- Favorites Index

## APIs consumed.
- [Edamam](https://www.edamam.com/)
- [Geoapify](https://www.geoapify.com/places-api)
- [Youtube](https://developers.google.com/youtube/v3)
- [Unsplash](https://unsplash.com/developers)
- [Rest Countries](https://restcountries.com/)

## [Repo Link](https://github.com/lcole37/lunch-and-learn)


## Directions after cloning

**Acquire api keys from the first 4 apis listed above**

`bundle install`

`bundle exec figaro install`

 **Add api keys to application.yml file using variables:**
 - api-ninja-key
 - places_api_key
 - edamam_app_id
 - edamam_api_key
 - youtube_api_key
 - unsplash_api_key

`rails db:{drop,create,migrate,seed}`

`rails s`
