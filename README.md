# bookmark-manager

### User Stories

```
As a <Stakeholder>,
So that <Motivation>,
I'd like <Task>.

As a User
So that I can keep a record of interesting websites,
I'd like to view a list of bookmarks.
```

### How to Run

```
bundle exec rackup
```

The application should then be running on http://localhost:9292

### How to setup the database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`

### How to Run Tests

```
bundle exec guard --clear
```

### How to setup the test database

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager_test;`
4. Run the tests (setup_test_database.rb will create the bookmarks table)
