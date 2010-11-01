require 'rspec'
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'
require 'rspec/rails'

SPEC_DIR = File.dirname(__FILE__)
lib_path = File.expand_path("#{SPEC_DIR}/../lib")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

require 'powerux-multiselect'

require 'active_support'
require 'action_controller'
require 'action_view'
require 'active_support/railtie'
require 'rails/all'

module Minimal
  class Application < Rails::Application
    config.active_support.deprecation = :log
  end
end

Rspec.configure do |c|
  c.mock_with :rspec
end
