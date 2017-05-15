require "bundler/setup"


enable  :sessions, :logging

Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

get "/producers" do
  erb :producer_login
end

post "/producer/signup" do
  attendee = Attendee.new(:user_name => params[:user_name], :password => params[:password])
  if attendee.save
    puts "Success!"
    redirect back
  else
    puts "Failure."
    erb :security
  end
end



post "/attendee/signup" do
  attendee = Attendee.new(:user_name => params[:user_name], :password => params[:password])
  if attendee.save
    puts "Success!"
    redirect back
  else
    puts "Failure."
    erb :security
  end
end


post "/attendee/login" do
  attendee = Attendee.find_by(:user_name => params[:user_name])
  if attendee && attendee.authenticate(params[:password])
    session[:user_id] = attendee.id
    puts "Success!"
    erb :attendee
  else
    puts "Failure."
    erb :security
  end
end

get "/attendee/:id" do
  if session[:user_name] !=nil
    @artist.all
    erb :attendee
  else
    erb :security
  end
end
