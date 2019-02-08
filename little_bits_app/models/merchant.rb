class Merchant

attr_accessor :name
attr_reader :id

  def initialize(merchant)
    @id = merchant['id'].to_i if merchant['id']
    @name = merchant['name']
  end


end
