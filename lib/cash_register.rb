class CashRegister
  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.last_transaction = (price * quantity)
    self.total += last_transaction
    quantity.times { self.items.push title }
  end

  def apply_discount
    if self.discount != 0
      percent_off = (100.00 - self.discount) / 100.00
      self.total = (self.total * percent_off).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
