require "bundler/setup"



Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
enable  :sessions, :logging

get "/" do
  erb :index
end


post "/attendee/signup" do
  attendee_name = params['name']
  attendee_username = params['username']
  attendee_password = params['password']
  @attendee = Attendee.create(:name => attendee_name, :username => attendee_username, :password => attendee_password, :id => nil)
  if @attendee.save
    erb :attendee
  else
    erb :security
  end
end

get "/attendee/signin" do

  erb :attendee_login
end

post "/attendee/success" do
  @attendee = Attendee.find_by(:username => params.fetch('username'))
  if @attendee.password == params.fetch('password')
    session[:user_id] = @attendee.id
    erb :attendee
  else
    erb :security
  end
end

# end
get "/attendee/:id" do
  id = params.fetch('id')
  @attendee = Attendee.find(id)
  if session[:username] !=nil
    @artist.all
    erb :attendee
  else
    erb :security
  end
end



# ******** PRODUCER/ADMIN SIDE ********



get "/producer/signin" do
  erb :producer_login
end



get "/producer/signup" do
  erb :producer_create_account
end



post "/producer/signup" do
  producer_name = params['name']
  producer_username = params['username']
  producer_password = params['password']
  @producer = Producer.create(:name => producer_name, :username => producer_username, :password => producer_password, :id => nil)
  if @producer.save
    erb :producer_navigation
  else
    erb :security
  end
end
