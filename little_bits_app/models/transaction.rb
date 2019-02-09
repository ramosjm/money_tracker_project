require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

attr_accessor :amount, :tag_id, :merchant_id
attr_reader :id

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_f
    @tag_id = transaction['tag_id'].to_i
    @merchant_id = transaction['merchant_id'].to_i
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id =$1"
    values = [@merchant_id]
    merchant = SqlRunner.run(sql,values).first
    return Merchant.new(merchant)
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id =$1"
    values = [@tag_id]
    tag = SqlRunner.run(sql,values).first
    return Tag.new(tag)
  end

  def save()
    sql = "INSERT INTO transactions (amount, tag_id, merchant_id) VALUES ($1,$2,$3) RETURNING id"
    values = [@amount,@tag_id, @merchant_id]
    @id = SqlRunner.run(sql,values).first['id']
  end

  def update()
    sql = "UPDATE transactions SET (amount, tag_id, merchant_id) = ($1,$2,$3) WHERE id =$4"
    values = [@amount,@tag_id,@merchant_id,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    result = transactions.map{|transaction|Transaction.new(transaction)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first
    return Transaction.new(result)
  end

  def self.total() #tested in PRY
    total = 0.00
    transactions = Transaction.all()
    transactions.each { |transaction| total += transaction.amount }
    return total.round(2)
  end


end
