require 'csv'
desc "Seed database models from .csv files"
task :import_csv => :environment do
  Rake::Task['db:drop'].execute
  Rake::Task['db:create'].execute
  Rake::Task['db:migrate'].execute

  file = 'db/data/customers.csv'
  CSV.foreach(file, :headers => true) do |row|
    Customer.create!(row.to_hash)
  end

  file1 = 'db/data/merchants.csv'
  CSV.foreach(file1, :headers => true) do |row|
    Merchant.create!(row.to_hash)
  end

  file2 = 'db/data/items.csv'
  CSV.foreach(file2, :headers => true) do |row|
    item = Item.create!(row.to_hash)
    item.update(unit_price: (item.unit_price/100))
  end

  file3 = 'db/data/invoices.csv'
  CSV.foreach(file3, :headers => true) do |row|
    Invoice.create!(row.to_hash)
  end

  file4 = 'db/data/invoice_items.csv'
  CSV.foreach(file4, :headers => true) do |row|
    invoice_item = InvoiceItem.create!(row.to_hash)
    invoice_item.update(unit_price: (invoice_item.unit_price/100))
  end

  file5 = 'db/data/transactions.csv'
  CSV.foreach(file5, :headers => true) do |row|
    Transaction.create!(row.to_hash)
  end

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
end
