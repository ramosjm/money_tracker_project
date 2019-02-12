require_relative('../db/sql_runner.rb')

class User
  attr_accessor :first_name, :last_name, :budget

  def initialize(user)
    @id = user['id'].to_i if user['id']
    @first_name = user['first_name']
    @last_name = user['last_name']
    @budget = user['budget']
  end

  def full_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
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

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM users ORDER BY first_name"
    users = SqlRunner.run(sql)
    result = users.map { |user|User.new(user)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first
    return User.new(result)
  end

end
