ENV["RACK_ENV"] = "test"

require "bundler/setup"
Bundler.require :default, :test
set :root, Dir.pwd

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

    Attendee.all.each do |d|
      d.destroy
    end
<<<<<<< HEAD
    
=======
>>>>>>> 1fbda4fe40f33b9d09e94f7bc8f7695bc1a303dc
  end
end
