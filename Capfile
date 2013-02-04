load "deploy"

require "bundler/capistrano"
require "capistrano_colors"

Dir["vendor/gems/*/recipes/*.rb","vendor/plugins/*/recipes/*.rb"].each { |plugin| load(plugin) }

load "config/deploy"
