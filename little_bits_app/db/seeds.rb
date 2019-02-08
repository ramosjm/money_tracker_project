require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require('pry')

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

binding.pry
nil
