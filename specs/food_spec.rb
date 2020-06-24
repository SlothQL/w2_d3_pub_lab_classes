require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food.rb')

class TestFood < Minitest::Test

    def setup()
        @burger = Food.new("Cheeseburger", 10, 3)
        @peanuts = Food.new("Peanut", 2, 1)
    end

    def test_food_has_name()
        assert_equal("Cheeseburger", @burger.name())
    end

    def test_food_has_price()
        assert_equal(10, @burger.price())
    end

    def test_food_has_rejuvenation_level()
        assert_equal(1, @peanuts.rejuvenation_level())
    end

end