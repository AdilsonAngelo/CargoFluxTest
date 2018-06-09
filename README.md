# CargoFlux IT test

[![Maintainability](https://api.codeclimate.com/v1/badges/ea0d9334a9c7f716229c/maintainability)](https://codeclimate.com/github/AdilsonAngelo/CargoFluxTest/maintainability)

## [**Adilson Angelo**](https://github.com/AdilsonAngelo)

This RESTful API was deployed to a Heroku server on
 [https://cargoflux-test.herokuapp.com]()

#### Here are some important data about this project

* Ruby version: 2.2.6
* Rails version: 5.0
* Gems:
  - Faker - testing stub factory
  - Redcarpet - for parsing Markdown to HTML
* This project was created with no previous Ruby on Rails knowledge whatsoever

#### For this project I used PostgreSQL 10.3

Before runing the project localy you have to run

`rails db:create db:migrate`

in order to setup the database

To run the tests, just enter

`rails test`

## HTTP services

* root: 404
* Namespace: 'documents':

| What it does                                                                                                                                    	| URL    	| Method 	| Parameter                      	| Response                       	| Request Content-Type 	| Response Content-Type 	|
|-------------------------------------------------------------------------------------------------------------------------------------------------	|--------	|--------	|--------------------------------	|--------------------------------	|----------------------	|-----------------------	|
| It receives an JSON object with a non-empty "body" attribute  and returns the HTML version of the markdown body of the Document object as JSON with the id given by the database 	| `'/'`    	| POST   	| `{ "body": "lorem" }`            	| `{ "id": 0, "body": "lorem" }`   	| application/json     	| application/json      	|
| Returns the converted markdown as HTML of the document that matches the id parameter                                                            	| `'/:id'` 	| GET    	| :id                            	| `<h1>lorem<h1>`                  	| -                    	| html                  	|
| Returns a JSON list of all Document objects created                                                                                             	| `'/'`    	| GET    	| -                              	| `[]`                             	| -                    	| application/json      	|
| Receives an object with updated body and returns the same object with updated_at attribute changed  after it was saved on the database          	| `'/:id'` 	| PUT    	| `{ "id": 0, "body": "updated" }` 	| `{ "id": 0, "body": "updated" }` 	| application/json     	| application/json      	|
| Returns the deleted document that matches the :id parameter                                                                                     	| `'/:id'` 	| DELETE 	| :id                            	| `{ "id": 0, "body": "lorem" }`   	| -                    	| application/json      	|

#### Examples

Request:  
POST to  
`https://cargoflux-test.herokuapp.com/documents`  
with request body  
`{"body": "#Here is a heading"}`

Response:  
`{"id": 1, "body": "<h1>Here is a heading</h1>"}`  

Then

Request:  
GET to  
`https://cargoflux-test.herokuapp.com/documents/1`

Response:  
`<h1>Here is a heading</h1>`  

##### Making a POST with cURL

`curl -X POST -H "Content-Type: application/json" https://cargoflux-test.herokuapp.com/documents -d '{ "body": "#Here is a heading" }'`