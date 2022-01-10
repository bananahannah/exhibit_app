     
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

    if form_empty? redirect "/work"
  end


  db_query("INSERT INTO work (name, year, image_url, description, medium, designer) VALUES ('#{ params['name']}', '#{ params['year'].to_i }', '#{ params['image_url'] }', '#{ params['description'] }', '#{ params['medium'] }', '#{ params['designer'] }');")
  work = all_work()

  redirect "/"
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
  work = db_query( "SELECT * FROM work WHERE id=#{work_id};").first

  erb :edit, locals: {
    work: work
  }
end

# UPDATE
put '/work/:id' do

  update_work(
    params['name'],
    params['year'],
    params['image_url'],
    params['description'],
    params['medium'],
    params['designer'],
    params['id']
  )

  redirect "/work/#{params['id']}"
end

# DESTROY
get '/work/:id/delete' do
  id = params['id']
  db_query( "DELETE FROM work WHERE id = $1", [id]).first
  redirect to '/'
end

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
  redirect '/'
end

get '/login/new_user' do
  erb(:sign_up)
end


post '/login/new_user' do
  email = params['email']
  password = params['password']
  email_validation = email_validation(email)
  password_digest = BCrypt::Password.create(password)
  
  if email_validation 
    db_query("insert into users (email, password_digest) values ('#{email}', '#{password_digest}');")
    redirect '/'
  else 
    redirect '/login/new_user'
  erb(:sign_up, locals: {
    email: email,
    password: password
  })
  end
end


def logged_in?()
  if session[:user_id] 
    return true 
  else
    return false
  end 
end


def current_user() 
  
  sql = "select * from users where id = #{session[:user_id]};" #this isn't user input so its safe (we only use exec_params for user input)

  user = db_query(sql).first
  return OpenStruct.new(user)

end 