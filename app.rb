require "bundler/setup"



Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
enable  :sessions, :logging

get "/" do
  erb :index
end

get "/producers" do
  erb :producer_login
end

# post "/producer/signup" do
#   attendee = Attendee.new(:username => params[:username], :password => params[:password])
#   if attendee.save
#     puts "Success!"
#     redirect back
#   else
#     puts "Failure."
#     erb :security
#   end
# end

post "/attendee/signup" do
  attendee = Attendee.new(:name => params[:name], :username => params[:username], :password => params[:password])
  if attendee.save
    redirect back
  else
    erb :security
  end
end

post "/attendee/login" do
  attendee = Attendee.find_by(:username => params[:username])
  if attendee && attendee.authenticate(params[:password])
    session[:user_id] = attendee.id
    erb :attendee
  else
    erb :security
  end
end

get "/attendee/:id" do
  if session[:username] !=nil
    @artist.all
    erb :attendee
  else
    erb :security
  end
end
