require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



first = Startup.new("orange", "Bob", "orange.com")
second = Startup.new("apple", "Steve", "apple.com")

jessy = VentureCapitalist.new("Jessy", 1000000000000)
alonso = VentureCapitalist.new("Alonso", 10000)


jessy_fund = first.sign_contract(jessy, 'first', 10000)
jessy_fund2 = first.sign_contract(jessy, 'second', 10)
alonso_fund = second.sign_contract(alonso, 'first', 3040)

contract1 = jessy.offer_contract(first, 'first', 1000)
contract2 = alonso.offer_contract(second, 'second', 100003)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
