     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'bcrypt'
require_relative 'models/work.rb'
enable :sessions

get '/' do
  result = db_query("select * from work;")
  work = all_work()

  erb :index
end

# NEW - GETS THE FORM
get '/work' do
  erb :new
end

# CREATE
post '/work' do

  redirect '/login' unless logged_in?
  erb(:new)  


  db_query( "INSERT INTO work name='#{ params[:name]}', year='#{ params[:year].to_i }', image_url='#{ params[:image_url] }',description='#{ params[:description] }', medium='#{ params[:medium] }', 'designer='#{ params[:designer] }'")
  work = all_work()

  redirect to "/work/#{ params[:id] }"
end

# SHOW
get '/work/:id' do
  work_id = params['id']
  work = db_query( "SELECT * FROM work WHERE id = $1", [work_id]).first
  
  erb :work_info, locals: {
    work: work
  }
end

# EDIT
get '/work/:id/edit' do
  work_id = params['id']
  work = db_query( "SELECT * FROM work WHERE id=#{work_id}").first
  erb :edit, locals: {
    work: work
  }
end

# UPDATE
put '/work/:id/update' do
  work = db_query( "UPDATE work SET title='#{ params[:title]}', year='#{ params[:year].to_i }', image_url='#{ params[:image_url] }',description='#{ params[:description] }', medium='#{ params[:medium]}', designer='#{params[:designer]}', WHERE id=#{ params[:id] }")

  update_work(
    params['work'],
    params['title'],
    params['year'],
    params['image_url'],
    params['description'],
    params['medium']
  )
  erb :new, locals: {
    work: work
  }

  redirect to "/work/#{ params[:id] }"
end

# DESTROY
get '/work/:id/delete' do
  id = params['id']
  db_query( "DELETE FROM work WHERE id=#{id}")
  redirect to '/'
end

# REGISTER


# GETS LOGIN FORM
get '/login' do 
  "show login form"
  erb(:login)
end

#for logging in
post '/session' do
  # check with the database 
  email = params["email"]
  user_plain_password = params["password"]
  users = db_query("select * from users where email = '#{email}';")

  # if result.count > 0 && BCrypt::Password.new(result[0]['password_digest']) == password
  if users.count > 0 && password_correct?(user_plain_password, users)

    # write down this user is logged in 
    session[:user_id] = users[0]['id'] #its a hash / session for a single user 


    redirect '/'  
  else
    erb(:login)
  end

  
end

# for logging out
delete '/session' do 
  session[:user_id] = nil
  redirect '/login'
end

post '/work/new_user' do
  email = params['email']
  password = params['password']
  db_query("insert into users (email, password_digest) values ('#{email}', '#{password_digest}');")

  erb(:sign_up, locals: {
    email: email,
    password: password
  })
end