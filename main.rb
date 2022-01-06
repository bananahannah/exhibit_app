     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'bcrypt'
require_relative 'models/work.rb'

get '/' do
  result = db_query("select * from work;")
  work = all_work()

  erb :index
end

# INDEX
get '/index' do
  db_query("SELECT * FROM work;")
  erb :work
end

# NEW
get '/work' do
  erb :work
end

# CREATE
post '/work' do
  db_query( "INSERT INTO work title='#{ params[:title]}', year='#{ params[:year].to_i }', image_url='#{ params[:image_url] }',description='#{ params[:description] }', medium='#{ params[:medium] }'")
  work = all_work()

  redirect to '/work'
end

# SHOW
get '/work/:id' do
  work_id = params['id']
  work = db_query( "SELECT * FROM work WHERE id=#{work_id}").to_s
  
  erb :work_info, locals: {
    work: work
  }
end

# EDIT
get '/work/:id/edit' do
  work_id = params['id']
  db_query( "SELECT * FROM work WHERE id=#{work_id}").to_s
  erb :edit
end

# UPDATE
post '/work/:id' do
  db_query( "UPDATE work SET title='#{ params[:title]}', year='#{ params[:year].to_i }', image_url='#{ params[:image_url] }',description='#{ params[:description] }', medium='#{ params[:medium] }' WHERE id=#{ params[:id] }")
  redirect to "/work/#{ params[:id] }"
end

# DESTROY
get '/work/:id/delete' do
  db_query( "DELETE FROM work WHERE id=#{ params[:id] }")
  redirect to '/work'
end




