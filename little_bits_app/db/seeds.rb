require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require('pry')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


tag_1 = Tag.new({
  'tag_type' => 'groceries'
  })

tag_2 = Tag.new({
  'tag_type' => 'transport'
  })

tag_3 = Tag.new({
  'tag_type' => 'entertainment'
  })

tag_4 = Tag.new({
  'tag_type' => 'bills'
  })

tag_1.save
tag_2.save
tag_3.save
tag_4.save

merchant_1 = Merchant.new({
  'name' => 'Tesco'
  })

merchant_2 = Merchant.new({
  'name' => 'Lothian Buses'
  })

merchant_3 = Merchant.new({
  'name' => 'Cineworld'
  })

merchant_4 = Merchant.new({
  'name' => 'BT'
  })

merchant_1.save
merchant_2.save
merchant_3.save
merchant_4.save

transaction_1 =Transaction.new({
  'amount' => 12.50,
  'tag_id' => tag_1.id,
  'merchant_id' => merchant_1.id
  })

transaction_2 = Transaction.new({
  'amount' => 57.00,
  'tag_id' => tag_2.id,
  'merchant_id' => merchant_2.id
  })
transaction_3 = Transaction.new({
  'amount' => 17.50,
  'tag_id' => tag_3.id,
  'merchant_id' => merchant_3.id
  })
transaction_4 = Transaction.new({
  'amount' => 45.33,
  'tag_id' => tag_4.id,
  'merchant_id' => merchant_4.id
  })

transaction_1.save
transaction_2.save
transaction_3.save
transaction_4.save

merchant_1.name = 'asda'
merchant_1.update
tag_2.tag_type= 'travel'
tag_2.update

binding.pry
nil
