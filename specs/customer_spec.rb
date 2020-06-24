require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer.rb')

class TestCustomer < Minitest::Test
    def setup()
        @customer1 = Customer.new("Alina", 50)
        @customer2 = Customer.new("Rebeka", 45)
    end

    def test_customer_has_name()
        assert_equal("Rebeka", @customer2.name())
    end

    def test_customer_has_money_in_wallet()
        assert_equal(50, @customer1.wallet())
    end
end