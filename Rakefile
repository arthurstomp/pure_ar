# Extracted from https://gist.github.com/schickling/6762581
require "bundler"
Bundler.require :default
require 'yaml'

config = YAML::load(File.open('database.yml'))
test_db_config = config['test']
db_config = config['development']
db_config_admin = db_config.merge({'database' => 'postgres', 'schema_search_path' => 'public'})

namespace :db do
  desc 'Create database'
  task :create do
    db_name = db_config['database']
    test_db_name = test_db_config['database']
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.create_database db_name 
    ActiveRecord::Base.connection.create_database test_db_name 
    puts 'Database created.'
  end

  desc 'Drop database'
  task :drop do
    db_name = db_config['database']
    test_db_name = test_db_config['database']
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.drop_database db_name
    ActiveRecord::Base.connection.drop_database test_db_name
    puts 'Database deleted.'
  end

  desc "Migrate database"
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    migration_context = ActiveRecord::MigrationContext.new("db/migrate")
    migration_context.migrate
    Rake::Task["db:schema"].invoke
    puts "Database migrated."
  end

  desc "Migrate test database"
  task :migrate_test do
    ActiveRecord::Base.establish_connection(test_db_config)
    migration_context = ActiveRecord::MigrationContext.new("db/migrate")
    migration_context.migrate
    Rake::Task["db:schema"].invoke
    puts "Test Database migrated."
  end

  desc "Reset the database"
  task :reset => [:drop, :create, :migrate]

  desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require 'active_record/schema_dumper'
    filename = "db/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end
end

namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
class #{migration_class} < ActiveRecord::Migration
  def self.up
  end
  def self.down
  end
end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
