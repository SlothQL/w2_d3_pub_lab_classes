require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink.rb')

class TestDrink < Minitest::Test

    def setup()
        @beer = Drink.new("Lager", 3)
        @gin = Drink.new("Gordons", 4)
        @pimms = Drink.new("Pimm's", 6)
    end

    def test_drink_has_name()
        assert_equal("Lager", @beer.name())
    end

    def test_drink_has_price()
        assert_equal(4, @gin.price())
    end
    

end