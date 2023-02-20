#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# set :database, 'sqlite3:barbershop.db'
set :database, {adapter: "sqlite3", database: "barbershop.db.sqlite3"}

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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
	@c = Client.new #без этого при гет запросе возникает ошибка что @с не установлена
	erb :visit
end


post '/visit' do
	@c = Client.new params[:client]
	if @c.save
		erb "<h3>Thanks! You registred!</h3>"
	else
	@error = @c.errors.full_messages.first
		erb :visit
	end

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	c = Contact.new params[:contact]
	c.save

	erb :contacts

end
