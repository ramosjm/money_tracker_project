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

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant|Merchant.new(merchant) }
    return result
  end



  
end
