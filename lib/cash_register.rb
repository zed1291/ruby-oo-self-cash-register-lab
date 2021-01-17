require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total



    def initialize discount=0, total=0
        @total = total
        @discount = discount
        @items = []
    end

    def add_item title, price, quantity=1
        @items << title = {"title" => title, "price" => price, "quantity" => quantity}
        @total += price*quantity
    end

    def apply_discount
        return "There is no discount to apply." if @discount == 0
        @total = (@total*(1-@discount/100.0)).to_i
        "After the discount, the total comes to $#{@total}."
    end

    def items
        item_names = []
        @items.each do |item|
            i=0
            while i < item["quantity"] do
                item_names << item["title"]
                i+=1
            end
        end
        item_names
    end


    def void_last_transaction
        @total = @total-@items.last["price"]*@items.last["quantity"]
        @items.pop
    end

end