# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require 'tilt/erb'
require './bomb.rb'

enable :sessions
set :erb, format: :html5
set :public_folder, File.dirname(__FILE__) + '/static'

class BombApp < Sinatra::Base
  attr_accessor :bomb

  def initialize
    super
    @bomb = Bomb.new
  end

  post '/bomb_active_code' do
    bomb.change_active_code(params[:active_code])
    redirect '/bomb'
  end

  post '/bomb_deactive_code' do
    bomb.change_deactive_code(params[:deactive_code])
    redirect '/bomb'
  end

  get '/bomb' do
    session[:bomb] = bomb
    erb :bomb
  end

  post '/bomb_activate' do
    bomb.activate(params[:activation_code])
    redirect '/bomb'
  end

  post '/bomb_deactivate' do
    bomb.deactivate(params[:deactivation])
    redirect '/bomb'
  end

  get '/explode' do
    bomb.explode
    session[:bomb] = bomb
    erb :explode
  end

  # Run by calling ruby file_name.rb
  run! if app_file == $PROGRAM_NAME
end
