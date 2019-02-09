class Transaction

attr_accessor :amount, :tag_id, :merchant_id
attr_reader :id

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_f
    @tag_id = transaction['tag_id'].to_i
    @merchant_id = transaction['merchant_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (amount, tag_id, merchant_id) VALUES ($1,$2,$3) RETURNING id"
    values = [@amount,@tag_id, @merchant_id]
    @id = SqlRunner.run(sql,values).first['id']
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


end
