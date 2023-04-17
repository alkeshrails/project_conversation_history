# README

Information regarding this project:

* Using Ruby version
  ruby 3.0.0

* Using Ruby version
  rails  7

* System dependencies
  Postgres 14

## Local development flow

1) Clone the repository.

2) Go to project directory.

3) Run bundle install to install gems dependencies - 
  ```bundle install```

4) Setup database, update database.yml with username and password, then run - 
   ```rails db:create```
   ```rails db:migrate```
   ```rails db:seed```

5) Start the rails server - 
   ```rails s```

6) Finally go to `http://localhost:3000`

7) You can login via the email and password given in the seed file or can register via sign up page.

8) To run test/rspecs cases, run the following command on terminal - 
   ```rspec```




Questions that can be asked regarding this project - 

1. Do we need status updates in future for other models as well, not just for project status updates?
  
  Answer - I think it would be better if it could be a generic model that can be useed for other models as well in future, polymorphic approach would be a better apprach for it.

2. What should be the design for the application?

  Answer - Basic design can be added with proper structured view with a naviagtion bar.

3. What plugins/gems can be used for design purposes?

  Answer - Bootstrap or Tailwind can be used, but since our tech stack includes Tailwind we can prioritize that.

4. Authentication model which can be used?

  Answer - Devise can be used as its the popular one.

5. Does test cases needs to be added?

  Answer - It would be better if rspecs can be added, as it would make testing a lot easier.