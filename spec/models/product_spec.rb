require 'spec_helper'

RSpec.describe Product do
  let(:product_name) { 'arroz' }
  let(:product_price) { 1.5 }
  let!(:product) { Product.create name: product_name, price: product_price}

  it { expect(product.name).to eq product_name }
  it { expect(product.price).to eq product_price }

  it { expect(product.transactions).to be_empty }

  it 'has transactions' do
    transaction_amount = 100
    transaction_total_price = 150
    product.transactions.create amount: transaction_amount, total_price: transaction_total_price
    expect(product.transactions.size).to eq 1
    expect(product.transactions.first.amount).to eq transaction_amount
    expect(product.transactions.first.total_price).to eq transaction_total_price
  end

  describe '#stock' do
    context 'is zero when' do
      it 'has no transaction' do
        expect(product.stock).to eq 0
      end

      it 'has sum 0 of transactions amount' do
        product.transactions.create amount: 10, total_price: -15.0
        product.transactions.create amount: -10, total_price: 15.0
        expect(product.stock).to eq 0
      end
    end

    context 'is positive when' do
      it 'has an positive sum of transactions amount' do
        product.transactions.create amount: 10, total_price: -15.0
        product.transactions.create amount: -15, total_price: 22.5
        expect(product.stock).to eq -5
      end
    end

    context 'is negative when' do
      it 'has an negative sum of transactions amount' do
        product.transactions.create amount: 15, total_price: -22.5
        product.transactions.create amount: -10, total_price: 15.0
        expect(product.stock).to eq 5
      end
    end
  end

  describe '#net_worth' do
    context 'is zero when' do
      it 'has no transaction' do
        expect(product.net_worth).to eq 0
      end

      it 'has sum 0 of transactions total_price' do
        product.transactions.create amount: 10, total_price: -15.0
        product.transactions.create amount: -10, total_price: 15.0
        expect(product.net_worth).to eq 0
      end
    end

    context 'is positive when' do
      it 'has an positive sum of transactions total_prices' do
        product.transactions.create amount: 10, total_price: -15.0
        product.transactions.create amount: -15, total_price: 22.5
        expect(product.net_worth).to eq 7.5
      end
    end

    context 'is negative when' do
      it 'has an negative sum of transactions total_prices' do
        product.transactions.create amount: 15, total_price: -22.5
        product.transactions.create amount: -10, total_price: 15.0
        expect(product.net_worth).to eq -7.5
      end
    end
  end
end
