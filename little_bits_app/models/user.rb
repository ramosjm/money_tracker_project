require_relative('../db/sql_runner.rb')

class User
  attr_accessor :first_name, :last_name, :budget

  def initialize(user)
    @id = user['id'] if user['id']
    @first_name = user['first_name']
    @last_name = user['last_name']
    @budget = user['budget']
  end


end
