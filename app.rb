require "bundler/setup"
require 'pry'
require "pry-byebug"



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
  @artist = Artist.all
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

post "/producer/signed-in" do
  @producer = Producer.find_by(:username => params.fetch('username'))
  if @producer.password == params.fetch('password')
    session[:user_id] = @producer.id
    @stages = Stage.all
    @artists = Artist.all
    redirect "/producer/#{@producer.id}"
  else
    redirect back
  end
end

get "/producer/signup" do
  erb :producer_create_account
end

post "/producer" do
  producer_data = params.fetch('producer')
  @producer = Producer.create(producer_data)
  if @producer.save
    redirect "/producer/#{@producer.id}"
  else
    @message = "Please enter correct information"
    redirect back
  end
end

get "/producer/:id" do
  @producer = Producer.find(params.fetch('id'))
  @stages = Stage.all
  @artists = Artist.all
  erb :producer
end

get "/producers/add-artists" do
  @artists = Artist.all
  erb :producer_add_artists
end

post "/producers/add-artists" do
  artist_data = params.fetch('artist')
  @artist = Artist.create(artist_data)
  redirect back
end


# PRODUCER ARTIST CRUD *********

get "/producer/artist/:id" do
  id = params.fetch('id')
  @artist = Artist.find(id)
  erb :artist
end


# PRODUCER STAGE CRUD **********

get "/stages/add" do
  @stages = Stage.all
  erb :add_stage
end

post "/stages/new" do
  stage_name = params["stage_name"]
  @stage = stage_name
  new_stage = Stage.create({:name => stage_name})
  redirect back
end

get "/stages/:id" do
  @stage = Stage.find(params.fetch('id').to_i)
  erb :stage
end
