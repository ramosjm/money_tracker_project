require('minitest/autorun')
require('minitest/rg')
require_relative('../tag.rb')

class TagTest < MiniTest::Test

  def setup()
    @tag_1 = Tag.new({
      'tag_type' => 'groceries'
      })
  end

  def test_can_create_tag()
    assert_equal(Tag,@tag_1.class)
  end

  def test_get_tag_type()
    assert_equal('groceries',@tag_1.tag_type)
  end

end
