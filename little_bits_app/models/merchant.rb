require_relative('../db/sql_runner.rb')

class Merchant

attr_accessor :name
attr_reader :id

  def initialize(merchant)
    @id = merchant['id'].to_i if merchant['id']
    @name = merchant['name']
  end


  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    merchant = SqlRunner.run(sql,values).first
    @id = merchant['id'].to_i
  end

  def update()
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant|Merchant.new(merchant) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run(sql,values).first
    return Merchant.new(merchant)
  end


end
