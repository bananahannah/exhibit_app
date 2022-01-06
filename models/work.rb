require 'pry'

def db_query(sql, params = [])
    conn = PG.connect( dbname: 'exhibit_app' )
    result = conn.exec_params(sql, params) #always returns an array
    conn.close
    return result 
end


def all_work()
    db_query('select * from work;') 
end
  
  
def add_work(name, year, image_url, description, medium) 
    sql = "insert into work (name, year, image_url, description, medium) values ($1, $2, $3, $4, $5)"  
    db_query(sql, [name, year, image_url, description, medium])
end
  
  
def delete_work(id)
    db_query("delete from dishes where id = $1;", [id])
end
  

def update_work(name, year, image_url, description, medium) 
    sql = "update dishes set name = $1, year = $2, image_url = $3, description = $4, medium = $5;"
    db_query(sql, [name, year, image_url, description, medium])
end

def logged_in?()
    if session[:user_id] 
      return true 
    else
      return false
    end 
end
  
def password_correct?(password, result)
    result.count > 0 && BCrypt::Password.new(result[0]['password_digest']) == password
end
  
  
def current_user() 
  
    sql = "select * from users where id = #{ session[:user_id]};" #this isn't user input so its safe (we only use exec_params for user input)
  
    user = db_query(sql).first
    return OpenStruct.new(user)
  
end
  