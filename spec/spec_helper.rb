require_relative '../setup'
require 'rspec'
require 'database_cleaner'
require 'yaml'

# Monkey patch _(:3」∠)_. I reset ActiveRecord to test_db
ActiveRecord::Base.connection.close
db_config = YAML::load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(db_config['test'])

RSpec.configure do |config|

  # Configure DatabaseCleaner to clean database after every
  # test.
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
