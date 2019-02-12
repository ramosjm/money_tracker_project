require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

attr_accessor :amount, :tag_id, :merchant_id
attr_reader :id, :date_added

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_f
    @tag_id = transaction['tag_id'].to_i
    @merchant_id = transaction['merchant_id'].to_i
    @date_added = transaction['date_added'] if transaction['date_added']
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
    sql = "INSERT INTO transactions (amount, tag_id, merchant_id) VALUES ($1,$2,$3) RETURNING id, date_added"
    values = [@amount,@tag_id, @merchant_id]
    result = SqlRunner.run(sql,values).first
    @id = result['id'].to_i
    @date_added = result['date_added']
  end

  def update()
    sql = "UPDATE transactions SET (amount, tag_id, merchant_id,date_added) = ($1,$2,$3,$4) WHERE id =$5"
    values = [@amount,@tag_id,@merchant_id,@date_added,@id]
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
    sql = "SELECT * FROM transactions ORDER BY date_added"
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

  def self.total()
    total = 0.00
    transactions = Transaction.all()
    transactions.each { |transaction| total += transaction.amount }
    return total.round(2)
  end

  # def self.sort()
  #   transactions= Transaction.all
  #   result= transactions.sort_by{|transaction|transaction['id']}
  #   return result
  # end
end
