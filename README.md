# Gabe new challange

Implement the product and transaction using active_record and postgresql.

> The following is just an TL;DR of the links. Please follow the links for more knowledge. (∩｀-´)⊃━☆ﾟ.*･｡ﾟ

## [Yaml](https://learnxinyminutes.com/docs/yaml/) and [database.yml](https://edgeguides.rubyonrails.org/configuring.html#configuring-a-database)

Yaml is like [JSON](https://www.json.org/), just a sintax to express data.

`database.yml` contains the configuration for the database used in the project.

## [Bundler](https://bundler.io/) and [Gemfile](https://bundler.io/gemfile.html)

Bundler is a gem (libraries on ruby) manager. The gems, their versions and the profiles for the project are described on the Gemfile

Run a `$ bundle install` (:

## `setup.rb`

`setup.rb` is an auxiliar file to setup the gems with bundler, ActiveRecord connection to the database and require model files.

## [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html)

It's a ruby gem that make easier the interaction of ruby with the database.

It provides the ways to connect the database, create queries using objects attributes and perform tasks in the database to mantain database's structruture.

You can find example of how to connect to the database on `setup.rb:12`

## [Rake](https://ruby.github.io/rake/)

Rake is a ruby task runner. The tasks as based on a `Rakefile` and can be used with `$ rake` command.

The tasks for this project are for managing the database and it's migrations. Is good to take a look to understand how this happen on background.

## [Migrations](https://edgeguides.rubyonrails.org/active_record_migrations.html)

Because we are not using rails and its rake tasks, we have to create the rake taks ourselves (see `Rakefile`) and we can use it with `rake g:migrations my_migration`

## [Schema](https://api.rubyonrails.org/classes/ActiveRecord/Schema.html)

Represents the current structure of the database.

## `db/`

Contains the `schema.rb` with the current database structure and the folder with all migrations - `db/migrate/`

## `models/`

Here live the models that you will have to implement. Because we are using active records to they should subclass `ActiveRecord::Base`

## `spec/` and tests

On `spec/` lives our tests and where you will find the especifications you will have to implement.

The tests are run using RSpec - `$ bundle exec rspec spec/`.

See `spec/spec_helper.rb` for info on how the environment is setup for tests.

## Gettings Started

Install bundler and use it to install Gems from Gemfile

```
$ gem install bundler
$ bundle install
```

Prepare database

```
$ rake db:create
$ rake db:migrate
$ rake db:migrate_test
```

See the tests failing

```
$ bundle exec rspec spec/
```

Create first migration

```
$ rake g:migration product
```

Now is your turn ;) 
