require "bundler/setup"


enable  :sessions, :logging

Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end


get "/attendee/:id" do
  if session[:user_name] !=nil
    @artist.all
    erb :attendee
  else
    erb :security
  end
end

post "/signup" do
  user = User.new(:user_name => params[:user_name], :password => params[:password])
  if user.save
    puts "Success!"
    redirect back
  else
    puts "Failure."
    erb :security
  end
end

post "/login" do
  user = User.find_by(:user_name => params[:user_name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    puts "Success!"
    redirect back
  else
    puts "Failure."
    erb :security
  end
end
