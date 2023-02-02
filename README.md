# README

* Ruby version

  3.1.0

* How to run the test suite

  To run the cucumber test suite, run:

  `cucumber`

  To run the rspec test suite, run:

  `rspec`

* How to run the project

  Run `rails s` in the command line
  Go to http://localhost:3000
  Follow the user stories below

* Instructions for project

PART 1

a. The data needs to load into 3 tables. People, Locations and Affiliations
b. A Person can belong to many Locations
c. A Person can belong to many Affiliations
d. A Person without an Affiliation should be skipped
e. A Person should have both a first_name and last_name. All fields need to be validated except for last_name, weapon and vehicle which are optional.
f. Names and Locations should all be titlecased

PART 2

1. As a user, I should be able to view these results from the importer in a table.
2. As a user, I should be able to paginate through the results so that I can see a maximum
of 10 results at a time.
3. As a user, I want to type in a search box so that I can filter the results I want to see.
4. As a user, I want to be able to click on a table column heading to reorder the visible
results.

* Additional Assumptions

As a Person without an Affiliation should be skipped, there will not be a validation error message on upload of the CSV (it will simply skip the row)
A Person is not valid without at least one Affiliation
A Person is not valid without at least one Location

* Future things to do

Add more tests.

Add more CSS to make the page look nicer.

Validation on user to make sure the same user can’t be created multiple times. Ideally add a column like email where you can be guaranteed it’s unique. 

Validating some fields from a list so that there aren’t issues with slightly different spellings of the same thing.
