require('minitest/autorun')
require('minitest/rg')
require_relative('../user.rb')

class UserTest < MiniTest::Test

  def setup()
    @user_1 = User.new({
      'first_name' => 'will',
      'last_name' => 'smith'
      'budget' => 1320.40
      })
  end

end
