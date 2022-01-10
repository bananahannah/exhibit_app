require 'pry'


def db_query(sql, params = [])
    conn = PG.connect( dbname: 'exhibit_app' )
    result = conn.exec_params(sql, params) #always returns an array
    conn.close
    return result 
end


def all_work()
    sql = "select * from work;"
    db_query(sql)
end
  
  
def add_work(name, year, image_url, description, medium, designer) 
    sql = "insert into work (name, year, image_url, description, medium, designer) values ($1, $2, $3, $4, $5, $6)".first
    db_query(sql, [name,year, image_url, description, medium, designer])
end
  
  
def delete_work(id)
    sql = "delete from work where id = $1;"
    db_query(sql, [id])
end
  

def update_work(name, year, image_url, description, medium, designer, id) 
    sql = "update work set name = $1, year = $2, image_url = $3, description = $4, medium = $5, designer = $6 where id = $7;"
    db_query(sql, [name, year, image_url, description, medium, designer, id])
end

def password_correct?(password, result)
    BCrypt::Password.new(result[0]['password_digest']) == password
end

  
def new_user()
    sql = "insert into users (email, password_digest) values ('#{email}', '#{password_digest}');"
    db_query(sql)
end

def email_validation(email)
    sql = "select from users where email = '#{email}';"
    result = db_query(sql)
   
    if result.count == 0 
        return true 
    end
end 

def form_empty?(name, image_url)
    if name == nil && image_url == nil
        return true 
      else
        return false
      end 
end