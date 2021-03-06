require('minitest/autorun')
require('minitest/rg')
require_relative('../user.rb')

class UserTest < MiniTest::Test

  def setup()
    @user_1 = User.new({
      'first_name' => 'will',
      'last_name' => 'smith',
      'budget' => 1320.40
      })
  end

  # TDD
  def test_can_create_user()
    assert_equal(User,@user_1.class)
  end

  def test_get_first_name()
    assert_equal('will',@user_1.first_name)
  end

  def test_get_last_name()
    assert_equal('smith',@user_1.last_name)
  end

  def test_get_budget()
    assert_equal(1320.40,@user_1.budget)
  end


  def test_pretty_budget()
    user = User.new({
      'first_name' => 'will',
      'last_name' => 'smith',
      'budget' => 123123.00
    })
    result = user.pretty_budget()
    assert_equal('123,123.00', result)
  end

  def test_pretty_budget_2()
    user = User.new({
      'first_name' => 'will',
      'last_name' => 'smith',
      'budget' => 123123123
    })
    result = user.pretty_budget()
    assert_equal('123,123,123', result)
  end

end
