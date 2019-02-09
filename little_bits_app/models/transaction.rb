class Transaction

attr_accessor :amount, :tag_id, :merchant_id
attr_reader :id

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_f
    @tag_id = transaction['tag_id'].to_i
    @merchant_id = transaction['merchant_id'].to_i

  end
end
