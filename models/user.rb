
def find_user_by_id() 
    db_query('select * from useres where id = $1;', [id]).first
end