# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require 'tilt/erb'
require './bomb.rb'

enable :sessions
set :erb, :format => :html5
set :public_folder, File.dirname(__FILE__) + '/static'

class BombApp < Sinatra::Base
	attr_accessor :bomb

	def initialize
		super
		@bomb = Bomb.new
	end

  post '/bomb_active_code' do
  	bomb.set_active_code(params[:active_code])
  	redirect '/bomb'
  end

  post '/bomb_deactive_code' do
  	bomb.set_deactive_code(params[:deactive_code])
  	redirect '/bomb'
  end

  get '/bomb' do
  	session[:bomb] = bomb
  	erb :bomb
  end

  post '/bomb_activate' do
  	if bomb.activate(params[:activation_code])
  		start_time
  	end
  	redirect '/bomb'
  end

  post '/bomb_deactivate' do
  	bomb.deactivate(params[:deactivation])
  	redirect '/bomb'
  end

  # we can shove stuff into the session cookie YAY!
  def start_time
    session[:start_time] ||= (Time.now).to_s
    session[:end_time] ||= (Time.now + 60).to_s
  end
  
  # Run by calling ruby file_name.rb
  run! if app_file == $0
end
