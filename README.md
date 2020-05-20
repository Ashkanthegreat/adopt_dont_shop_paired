# Adopt Don't Shop Paired
BE Mod 2 Week 2 Pair Project

Ashkan Abbasi 
Taylor Keller

## Description
Adopt Don't Shop is a website to streamline the adoption process. We host an index of shelters and their pets. Users are able to add/remove shelters and pets as well as review and rate shelters. If a user is interested in a specific pet, they can favorite that pet. When returning to the site we store user's favorited pets in a session, so they have quick and easy access to pets they may want to adopt. From the Favorited pet list, users are able to apply to adopt pets they are interested in. 

## Architecture 
  - This website is built with Ruby on Rails. 
  - We utilize the MVC architecture to organize our code. 
  - Front end makes heavy use of ActionView Helpers to build out the site's HTML 
  
## Challenges 
  - Paired workflow for tackling user stories
    - It took us some time to fall into an efficient git process. At first we were concerned about dependencies amongst user stories, but eventually became much more confortable working asynchronously through git branching
  - Passing user data from views to the controller. Especially passing an array through the parameters. 
  - Setting up and using a many-to-many relationship
  - Testing best practices and organization
  - Testing sad path cases 
  - Understanding what logic is and isn't appropriate to have in the view/controller/model 
  
## Takeaways for Future Projects
  - Set up factorybot at the beginning to improve testing speed
  - Seed the production database to help with frontend debugging
  - Implement Faker to help fill out production database
  - Organize tests in a more efficient manner. By the end of the project our test organization became messy. Try organizing test files on a per test basis instead of by web page. 
  - Make more use of inheritence for our controllers 
