# bookrater

Discover new books and find out what people are saying about them.

## Database Schema

![Database Schema](schema.png)

## Installation

Run bundle to install all dependencies

```
bundle install
```

Create, migrate, and seed the database:

```
bin/rake db:create db:migrate db:seed
```

Run the Rails server:

```
bin/rails s
```

The server will be available at http://localhost:3000

To run the **frontend server**, use the following command from the `App/` directory

```
ruby -run -e httpd . -p 9000
```

The frontend server will be available at http://localhost:9000
