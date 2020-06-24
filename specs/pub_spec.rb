require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../food.rb')

class TestPub < Minitest::Test

    def setup()
        @customer1 = Customer.new("Alina", 50, 17)
        @customer2 = Customer.new("Rebeka", 45, 24)
        @beer = Drink.new("Lager", 3, 1)
        @monster_drink = Drink.new("Monster Cocktail", 9, 12)
        @gin = Drink.new("Gordons", 4, 3)
        @pimms = Drink.new("Pimm's", 6, 2)
        @drinks = [{
            drink: @beer, 
            stock: 50},
            {drink: @gin,
            stock: 20},
            {drink: @pimms,
            stock: 5},
            {drink: @monster_drink,
            stock: 10}]
        @pub = Pub.new("Ryrie's", 1500, @drinks)
        @peanuts = Food.new("Peanut", 2, 1)
    end

    def test_pub_has_name
        assert_equal("Ryrie's", @pub.name())
    end

    def test_pub_has_money_in_till()
        assert_equal(1500, @pub.till())
    end

    def test_pub_has_drinks()
        assert_equal(4, @pub.count_drinks())
    end

    def test_increase_till_by_drink_price()
        @pub.increase_till(@gin)
        assert_equal(1504, @pub.till())
    end

    def test_give_stock()
        stock = @pub.give_stock(@pimms)
        assert_equal(5, stock)
    end

    def test_reduce_stock_of_drink()
        @pub.reduce_stock(@beer)
        assert_equal(49, @pub.give_stock(@beer))
    end
    
    def test_can_sell_drink_to_customer_is_old_enough_not_drunk()
        @pub.sell_drink_to_customer(@customer2, @pimms)
        assert_equal(1506, @pub.till())
        assert_equal(39, @customer2.wallet())
        assert_equal(2, @customer2.give_drunkenness_level())
        assert_equal(4, @pub.give_stock(@pimms))
    end

    def test_can_sell_drink_to_customer_is_old_enough_too_drunk()
        @customer2.increase_drunkenness_level(@monster_drink)
        response = @pub.sell_drink_to_customer(@customer2, @pimms)
        assert_equal("Sorry, you had enough for today!", response)
        assert_equal(1500, @pub.till())
        assert_equal(45, @customer2.wallet())
    end

    def test_can_sell_drink_to_customer_is_too_young()
        response = @pub.sell_drink_to_customer(@customer1, @pimms)
        assert_equal("You are too young to drink!", response)
        assert_equal(1500, @pub.till())
        assert_equal(50, @customer1.wallet())
    end

    def test_sell_food_to_customer()
        @customer2.increase_drunkenness_level(@monster_drink)
        @pub.sell_food_to_customer(@customer2, @peanuts)
        assert_equal(11, @customer2.give_drunkenness_level())
        assert_equal(43, @customer2.wallet())
        assert_equal(1502, @pub.till())
    end
    

end