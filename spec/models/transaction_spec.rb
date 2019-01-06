require 'spec_helper'

RSpec.describe Transaction do
  let!(:product) { Product.create name: 'arroz', price: 1.5 }
  let!(:transaction) { Transaction.create product: product, amount: 100, total_price: -150 }

  it { expect(transaction.product).to eq product }
  it { expect(transaction.amount).to eq 100 }
  it { expect(transaction.total_price).to eq -150 }

  it "should have coaf error" do
    transaction.amount = 100
    transaction.total_price = 10

    transaction.save
    expect(transaction.valid?).to eq false
    expect(transaction.errors[:coaf]).not_to eq nil
  end
end
