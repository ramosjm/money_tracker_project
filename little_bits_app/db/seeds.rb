require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require('pry')

Tag.delete_all()

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

binding.pry
nil
