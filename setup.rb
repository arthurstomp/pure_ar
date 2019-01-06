# Setup gems from Gemfile.
require "bundler"
Bundler.require :default
# Require Ruby Yaml lib.
require 'yaml'

# Fetch db config from './database.yml'.
# YAML is just another format of file to structure data like JSON.
db_config = YAML::load(File.open('database.yml'))

# Connect ActiveRecord to database.
ActiveRecord::Base.establish_connection(db_config['development'])

# Require all models defined inside folder './models/'
Dir.glob('./models/*.rb').each do |f|
  require_relative f
end
