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

    def increase_till(amount)
        return @till += amount
    end

    def get_price_of_drink(search_drink)
        for drink in @drinks
            if drink.name() == search_drink.name()
                return drink.price()
            end
        end
        return nil
    end

    #def can_sell_drink_to_customer(customer)
    #    drink_price = @drink.get_price_of_drink(drink_customer_wants)

    #end

end