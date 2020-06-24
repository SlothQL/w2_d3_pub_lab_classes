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
end