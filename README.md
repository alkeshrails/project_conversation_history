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
