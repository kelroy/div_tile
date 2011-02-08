require 'rubygems'
require 'dm-core'
require 'sinatra'
require 'haml'
require 'json'
require 'cobravsmongoose'
require 'lib/post'
require  'dm-migrations'

configure do 
	set :root, File.dirname(__FILE__)
  DataMapper.setup(:default, "sqlite://#{Dir.pwd}/div_tile.db")
  DataMapper.finalize
  DataMapper.auto_migrate!
end

get '/?' do
  
  @posts = Post.all  

  haml :show, :layout => :div 
end

post '/add/?' do
  
  @post = Post.new 
  @post.title = params[:title]
  @post.save
  redirect '/'
end

get '/form/?' do
  haml :form, :layout => :div 
end



