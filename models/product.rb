class Product < ActiveRecord::Base
  has_many :transactions

  def stock
    transactions.sum(:amount)
  end

  def net_worth
    transactions.sum(:total_price)
  end
end
