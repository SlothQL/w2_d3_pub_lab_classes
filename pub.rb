class Pub

    attr_reader :name, :till, :drinks
    
    def initialize(name, till, drinks)
        @name = name
        @till = till
        @drinks = drinks
    end

    def count_drinks()
        return @drinks.count
    end

    def increase_till(drink)
        return @till += drink.price
    end

    def sell_drink_to_customer(customer, drink)
        if customer.age >= 18 
            increase_till(drink)
            customer.reduce_money_in_wallet(drink)
        else 
            return "You are too young to drink!"
        end
    end
    

end