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

get '/' do
	erb :index
end
