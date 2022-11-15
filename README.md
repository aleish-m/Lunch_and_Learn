# README - Lunch and Learn

## Info
 This project was designed for an application that would be used to search for cuisines by country, and provide opportunity to learn more about that countries culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

 This project was created as a back-end service for a team working in a service oriented architecture. My job with this project was to expose the API that satisfies the front-end team’s requirements. (Please note: There is no front-end for this project wireframes were used for reference of the front-end interaction experience.)

## Learning Goals for this Project
  - Expose an API that aggregates data from multiple external APIs
  - Expose an API that requires an authentication token
  - Expose an API for CRUD functionality
  - Determine completion criteria based on the needs of other developers
  - Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Built With
![RoR](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![pgsql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## Gems

![rspec-rails](https://img.shields.io/gem/v/rspec-rails?label=rspec-rails&style=flat-square)
![shoulda](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers&style=flat-square)
![simplecov](https://img.shields.io/gem/v/simplecov?label=simplecov&style=flat-square)
![faker](https://img.shields.io/gem/v/faker?color=blue&label=faker)
![factory bot](https://img.shields.io/gem/v/factory_bot_rails?color=blue&label=factory_bot_rails)
![jsonapi-serializer](https://img.shields.io/gem/v/jsonapi-serializer?color=blue&label=jsonapi-serializer)
![pry](https://img.shields.io/gem/v/pry?color=blue&label=pry)
![faraday](https://img.shields.io/gem/v/faraday?color=blue&label=faraday)
![figaro](https://img.shields.io/gem/v/figaro?color=blue&label=figaro)
![vcr](https://img.shields.io/gem/v/vcr?color=blue&label=vcr)
![webmock](https://img.shields.io/gem/v/webmock?color=blue&label=webmock)

## External API's Utilized
(Please Note: If you wish to use this backen you will need to obtain your own API-keys form these services.)
  - [REST Countries API](https://restcountries.com/#api-endpoints-v3-all) - Used to get Country names 
  - [Edamam Recipe API](https://developer.edamam.com/edamam-recipe-api) - Used to find recipes (`recipe_api_key` and `recipe_api_id`)
  - [Google's YouTube API](https://developers.google.com/youtube/v3/getting-started) - Used to provide a video about the country. If one is found on the [Mr.History channel](https://www.youtube.com/channel/UCluQ5yInbeAkkeCndNnUhpw)(`youtube_api_key` and `mr_history_id`)
  - [Unsplash Image API](https://unsplash.com/developers) - Used to provide images of the country in learning resources (`unsplash_api_key`)
## Set Up
- Clone this repo
  - `bundle install`
  - `bundle exec figaro install`
  - Add your API keys in to the `application.yml` using the key names provided above
- Database set up
  - `rails db:{create,migrate,seed}`

## Deployment
- In terminal (apple or integrated)
    * `rails s`
- Navigate to desired API endpoint as noted below 
  - Test endpoints in Postman only some can be called in your browser

## Running Test Suite Instructions
- Follow above set up instructions
- In terminal (apple or integrated)
    * `bundle exec rspec`

## Database Structure

![image](https://user-images.githubusercontent.com/105686836/202042693-f57b38ac-183e-4585-941f-289da24f6dfc.png)

# End Points

### Recipe End Points

**Get Recipes for a Specified Country**

GET `http://localhost:3000/api/v1/recipes?country=<country_name>`

**Get Recipes for a Random Country**

GET `http://localhost:3000/api/v1/recipes`

```
  {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes...",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "THAI COCONUT CREMES",
                "url": "https://food52.com/recipes/37220-thai-coconut-cremes",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/..."
            }
        },
        ...
      ...
    ]
  }
  ```

**Error and Edge casing**
  - If an empty string is received for country
  - If no results found

  ```
  {
    "data": []
  }
```

### Learning Resources End Points

- This end point is build under the expectation that the country used for recipies will be the country passed to this endpoint.

**Get Learning Resources for specified country**

GET `http://localhost:3000/api/v1/learning_resources?country=<country name>`


```
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "thailand",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-..."
                },
                {
                    "alt_tag": "five brown wooden boats",
                    "url": "https://images.unsplash.com/photo-..."
                },
            ...
          ...
          ]
        }
      }
    }
  ```

**Error and Edge casing**
  - If an empty string is received for country (no country name will be returned)
  - If no results for images and/or images found they will return as a empty array

  ```
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": null,
            "video": [],
            "images": []
        }
    }
}
```

### User End Points

**Create a new User in database**
  - User info **Must** be passed to back-end using JSON body

POST `http://localhost:3000/api/v1/users`

Example JSON Request Body:
```
{ 
"name": "Mr. Ben Grant", 
"email": "jermaine.robel@block.com" 
}
```
Example Response:
```
{
    "data": {
        "id": "4",
        "type": "user",
        "attributes": {
            "name": "Athena Dao",
            "email": "athenadao@bestgirlever.com",
            "api_key": "9wO08Dz-IRuYJFbWGp7E_g"
        }
    }
}
```

**Error and Edge casing**
  - If a user exists with the same email adress and so new user not created

  ```
{
    "error": 400,
    "message": "Email has already been taken"
}
```

### Favorites End Points

**Create a new Favorite recipe for a user**
  - The information for creating a favorite **Must** be passed to back end using JSON body

POST `http://localhost:3000/api/v1/favorites`

Example JSON Request Body:
```
{
    "api_key": "4m2hhcq99xBewFe-wNAJGg",
    "country": "new zealand",
    "recipe_link": "http://www.marthastewart.com/355892/linguine-new-zealand-cockles",
    "recipe_title": "Linguine with New Zealand Cockles recipes"
}
```
EExample Response:
```
{
    "success": "Favorite added successfully"
}
```

**Error and Edge casing**
  - If invalid api_key provided

  ```
{
    "error": 404,
    "message": "Invalid user api key"
}
```
  - If missing a peice of info to create a favorite
    - The error message will indicate the reason favorite was not created/ missing info

  ```
{
    "error": 400,
    "message": "Recipe title can't be blank"
}
```

**Find all Favorites for a user**

GET `http://localhost:3000/api/v1/favorites?api_key=KHIs1RkntYbttRC1-Esqjw`

```
{
    "data": [
        {
            "id": "5",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Ebiten maki",
                "recipe_link": "http://ullrich-schaefer.info/alex",
                "country": "San Marino",
                "created_at": "2022-11-15T19:16:55.784Z"
            }
        }
    ]
}
```

**Error and Edge casing**
  - If invalid api_key provided

  ```
{
    "error": 404,
    "message": "Invalid user api key"
}
```
  - If user has no favorites

  ```
{
    "data": []
}
```

# Contributors
<p><a href="https://github.com/aleish-m/rails-engine/graphs/contributors">
<img src="https://contrib.rocks/image?repo=aleish-m/rails-engine" />
</a></p>

**Github:** <https://github.com/aleish-m/>  
**LinkedIn:** <https://www.linkedin.com/in/aleisha-mork/>