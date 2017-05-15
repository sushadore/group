ENV["RACK_ENV"] = "test"

require "bundler/setup"
Bundler.require :default, :test
set :root, Dir.pwd
<<<<<<< HEAD

=======
>>>>>>> e923f23cc3a396420e0ea1f8e30576f4aeecfa06
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require "capybara/rspec"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require "./app"

RSpec.configure do |config|
  config.after(:each) do
    Artist.all.each do |d|
      d.destroy
    end

    Stage.all.each do |d|
      d.destroy
    end
  end
end
