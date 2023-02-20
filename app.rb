#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# set :database, 'sqlite3:barbershop.db'
set :database, {adapter: "sqlite3", database: "barbershop.db.sqlite3"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.all

end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/visit' do

	erb :visit
end


post '/visit' do
	c = Client.new params[:client]
	c.save
		erb "<h3>Thanks! You registred!</h3>"

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	c = Contact.new params[:contact]
	c.save

	erb :contacts

end
