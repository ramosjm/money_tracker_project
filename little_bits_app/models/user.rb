require_relative('../db/sql_runner.rb')

class User
  attr_accessor :first_name, :last_name, :budget

  def initialize(user)
    @id = user['id'].to_i if user['id']
    @first_name = user['first_name']
    @last_name = user['last_name']
    @budget = user['budget']
  end

  def save()
    sql = "INSERT INTO users (first_name,last_name,budget) VALUES ($1,$2,$3) RETURNING id"
    values = [@first_name,@last_name,@budget]
    @id = SqlRunner.run(sql,values).first['id'].to_i
  end

  def update()
    sql = "UPDATE users SET (first_name,last_name,budget) = ($1,$2,$3) WHERE id = $4"
    values = [@first_name,@last_name,@budget,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM users WHERE id = $1"
    values= [@id]
    SqlRunner.run(sql,values)
  end


end
