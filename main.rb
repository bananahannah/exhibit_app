     
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
  erb :index
end

# NEW
get '/work' do
  erb :new
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
  work = db_query( "SELECT * FROM work WHERE id = $1")
  
  erb :work_info, locals: {
    work: work
  }
end

# EDIT
get '/work/:id/edit' do
  work_id = params['id']
  work = db_query( "SELECT * FROM work WHERE id=#{work_id}").to_s
  erb :edit, locals: {
    work: work
  }
end

# UPDATE
post '/work/:id' do
  work = db_query( "UPDATE work SET title='#{ params[:title]}', year='#{ params[:year].to_i }', image_url='#{ params[:image_url] }',description='#{ params[:description] }', medium='#{ params[:medium] }' WHERE id=#{ params[:id] }")

  erb :edit, locals: {
    work: work,
    title: title,
    year: year,
    image_url: image_url,
    description: description,
    medium: medium
  }

  redirect to "/work/#{ params[:id] }"
end

# DESTROY
get '/work/:id/delete' do
  id = params['id']
  db_query( "DELETE FROM work WHERE id=#{id}")
  redirect to '/work'
end




