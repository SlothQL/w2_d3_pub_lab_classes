require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class TestCustomer < Minitest::Test
    def setup()
        @customer1 = Customer.new("Alina", 50, 17)
        @customer2 = Customer.new("Rebeka", 45, 24)
        @beer = Drink.new("Lager", 3, 1)
        @gin = Drink.new("Gordons", 4, 3)
        @pimms = Drink.new("Pimm's", 6, 2)
        @peanuts = Food.new("Peanut", 2, 1)
    end

    def test_customer_has_name()
        assert_equal("Rebeka", @customer2.name())
    end

    def test_customer_has_money_in_wallet()
        assert_equal(50, @customer1.wallet())
    end

    def test_customer_has_age()
        assert_equal(24, @customer2.age())
    end

    def test_customer_drunkenness_level()
        assert_equal(0, @customer1.give_drunkenness_level())
    end 

    def test_customer_gets_money_reduces_in_wallet()
        @customer1.reduce_money_in_wallet(@gin)
        assert_equal(46, @customer1.wallet())
    end

    def test_drunkenness_level_gets_increased_by_alcohol_level()
        @customer1.increase_drunkenness_level(@pimms)
        assert_equal(2, @customer1.give_drunkenness_level())
    end

    def test_drunkenness_level_gets_decreased_by_rejuvenation_level()
        @customer1.increase_drunkenness_level(@gin)
        drunkenness_level = @customer1.decrease_drunkenness_level(@peanuts)
        assert_equal(2, @customer1.give_drunkenness_level())
    end

end