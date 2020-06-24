require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')

class TestPub < Minitest::Test

    def setup()
        @beer = Drink.new("Lager", 3)
        @gin = Drink.new("Gordons", 4)
        @pimms = Drink.new("Pimm's", 6)
        @drinks = [@beer, @gin, @pimms]
        @pub = Pub.new("Ryrie's", 1500, @drinks)
        @customer1 = Customer.new("Alina", 50)
        @customer2 = Customer.new("Rebeka", 45)
    end

    def test_pub_has_name
        assert_equal("Ryrie's", @pub.name())
    end

    def test_pub_has_money_in_till()
        assert_equal(1500, @pub.till())
    end

    def test_pub_has_drinks()
        assert_equal(3, @pub.count_drinks())
    end

    def test_pub_till_gets_increased()
        @pub.increase_till(6)
        assert_equal(1506, @pub.till())
    end

    def test_increase_till_by_drink_price()
        @pub.increase_till(@gin.price())
        assert_equal(1504, @pub.till())
    end
    
    def test_get_price_of_drink()
        price = @pub.get_price_of_drink(@gin)
        assert_equal(4, price)
    end

    #def test_customer_can_buy_drink_from_pub()
     #  @pub.can_sell_drink_to_customer(@customer1)
     #  assert_equal(1504, @pub.till())
    #   assert_equal(46, @customer1.wallet())
    #end
    

end