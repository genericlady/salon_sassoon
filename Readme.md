# A Sinatra Project
Sinatra with handrolled authorization and appointments model.

```
bundle install
rake db:migrate
```

# Launching the app with Rack locally

```
$ rackup config.ru
D, [2016-06-17T18:33:10.487677 #44617] DEBUG -- :   ActiveRecord::SchemaMigration Load (0.1ms)  SELECT "schema_migrations".* FROM "schema_migrations"
[2016-06-17 18:33:10] INFO  WEBrick 1.3.1
[2016-06-17 18:33:10] INFO  ruby 2.3.0 (2015-12-25) [x86_64-darwin15]
[2016-06-17 18:33:10] INFO  WEBrick::HTTPServer#start: pid=44617 port=9292
```

- now visit `localhost:9292` create a new account
- Appointments with full CRUD
