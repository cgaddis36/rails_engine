require 'rails_helper'

describe 'Business Intelligence API endpoints' do
  before(:each) do
  @merchant = create(:merchant)
  @merchant1 = create(:merchant)
  @merchant2 = create(:merchant)
  @merchant3 = create(:merchant)
  @item = create(:item, merchant_id: @merchant.id, unit_price: 30)
  @item1 = create(:item, merchant_id: @merchant.id, unit_price: 300)
  @item2 = create(:item, merchant_id: @merchant1.id, unit_price: 3)
  @item3 = create(:item, merchant_id: @merchant1.id, unit_price: 2)
  @item3 = create(:item, merchant_id: @merchant1.id, unit_price: 3)
  @item3 = create(:item, merchant_id: @merchant1.id, unit_price: 1)
  @item4 = create(:item, merchant_id: @merchant2.id, unit_price: 3000)
  @item5 = create(:item, merchant_id: @merchant2.id, unit_price: 300)
  @item6 = create(:item, merchant_id: @merchant3.id, unit_price: 4)
  @item7 = create(:item, merchant_id: @merchant3.id, unit_price: 1)
  @item7 = create(:item, merchant_id: @merchant3.id, unit_price: 5)

  @customer = Customer.create(first_name: Faker::TvShows::Simpsons.character,
    last_name: Faker::TvShows::GameOfThrones.dragon)

    @customer1 = Customer.create(first_name: Faker::TvShows::Simpsons.character,
      last_name: Faker::TvShows::GameOfThrones.dragon)

      @invoice = Invoice.create(merchant_id: @merchant.id, customer_id: @customer.id, status: "shipped")
      @invoice1 = Invoice.create(merchant_id: @merchant1.id, customer_id: @customer.id, status: "shipped")
      @invoice2 = Invoice.create(merchant_id: @merchant2.id, customer_id: @customer1.id, status: "shipped")
      @invoice3 = Invoice.create(merchant_id: @merchant3.id, customer_id: @customer1.id, status: "shipped")

      @invoice_item = InvoiceItem.create(item_id: @item.id, invoice_id: @invoice.id, quantity: 70, unit_price: @item.unit_price)
      @invoice_item1 = InvoiceItem.create(item_id: @item1.id, invoice_id: @invoice.id, quantity: 70, unit_price: @item1.unit_price)
      @invoice_item2 = InvoiceItem.create(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 7, unit_price: @item2.unit_price)
      @invoice_item3 = InvoiceItem.create(item_id: @item3.id, invoice_id: @invoice1.id, quantity: 3, unit_price: @item3.unit_price)
      @invoice_item4 = InvoiceItem.create(item_id: @item4.id, invoice_id: @invoice2.id, quantity: 700, unit_price: @item4.unit_price)
      @invoice_item5 = InvoiceItem.create(item_id: @item5.id, invoice_id: @invoice2.id, quantity: 703, unit_price: @item5.unit_price)
      @invoice_item6 = InvoiceItem.create(item_id: @item5.id, invoice_id: @invoice3.id, quantity: 3, unit_price: @item6.unit_price)
      @invoice_item7 = InvoiceItem.create(item_id: @item7.id, invoice_id: @invoice3.id, quantity: 7, unit_price: @item7.unit_price)

      @transaction = Transaction.create(invoice_id: @invoice.id, result: "success")
      @transaction1 = Transaction.create(invoice_id: @invoice1.id, result: "success")
      @transaction2 = Transaction.create(invoice_id: @invoice2.id, result: "success")
      @transaction3 = Transaction.create(invoice_id: @invoice3.id, result: "success")
    end
  it 'can find most revenue for a determined number of merchants' do

    get '/api/v1/merchants/most_revenue?quantity=2'

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[0][:id].to_i).to eq(@merchant2.id)
    expect(parsed_data[-1][:id].to_i).to eq(@merchant.id)
  end
  it 'can find most items for each merchant by quantity' do

    get '/api/v1/merchants/most_items?quantity=2'

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data.count).to eq(2)
  end
end
