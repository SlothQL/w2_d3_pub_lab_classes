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

    def increase_till(input)
        return @till += input.price
    end

    def give_stock(requested_drink)
        for hash in @drinks
            if (hash[:drink] == requested_drink)
                return hash[:stock]
            end
        end
    end

    def reduce_stock(requested_drink)
        for hash in @drinks
            if (hash[:drink] == requested_drink)
                hash[:stock] -= 1
            end
        end
    end

    def stock_value()
        total_value = 0
        for hash in @drinks
            stock = give_stock(hash)
            value_each_drink = stock * hash[:drink].price
            total_value += value_each_drink
        end
        return total_value
    end

    def sell_drink_to_customer(customer, drink)
        if (customer.age >= 18 && customer.give_drunkenness_level() <= 10)
            increase_till(drink)
            customer.reduce_money_in_wallet(drink)
            customer.increase_drunkenness_level(drink)
            reduce_stock(drink)
        elsif (customer.age >= 18 && customer.give_drunkenness_level() > 10)
            return "Sorry, you had enough for today!"
        else 
            return "You are too young to drink!"
        end
    end
    
    def sell_food_to_customer(customer, food)
        customer.decrease_drunkenness_level(food)
        customer.reduce_money_in_wallet(food)
        increase_till(food)
    end

end