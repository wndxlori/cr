require 'test/unit'
require 'rubygems'
gem 'rails', '>=3.0.0'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["RAILS_ENV"] = "test"

require 'rails/all'
require 'rails/test_help'
require 'powerux-multiselect'

module PoweruxMultiselect
  class Application < Rails::Application
  end
end

PoweruxMultiselect::Application.routes.draw do
  match '/:controller(/:action(/:id))'
end

ActionController::Base.send :include, PoweruxMultiselect::Application.routes.url_helpers