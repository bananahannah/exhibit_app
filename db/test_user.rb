require 'pg'
require 'bcrypt'


puts "create test user!"

# hard code the email and passwrord 

email = "hannahcaitlinc@outlook.com"
password = "pw123"

# connect to the db 
conn = PG.connect(dbname: 'exhibit_app')

password_digest = BCrypt::Password.create(password)

sql =  "insert into users (email, password_digest) values ('#{email}', '#{password_digest}');"

# execute an insert statement to create a new user 
conn.exec(sql)
conn.close

puts "done!"