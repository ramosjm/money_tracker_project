require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/users_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('./models/transaction.rb')
require_relative('./models/tag.rb')
require_relative('./models/user.rb')
require_relative('./models/merchant.rb')
also_reload('./models/*')

get '/' do
  @@transactions = Transaction.all()
  @@total = Transaction.total()
  @@user = User.all.first()
  remaining_budget = @@user.budget.to_f - @@total.to_f
  @@remaining_budget = remaining_budget.to_s.reverse.gsub(/(\d+\.)?(\d{3})(?=\d)/, '\\1\\2,').reverse
    if @@remaining_budget[-2] =='.'
      @@remaining_budget= @@remaining_budget +'0'
    else
      @@remaining_budget= @@remaining_budget
    end
  erb( :"transaction/index" )
end
