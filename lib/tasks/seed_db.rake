# require 'csv'
# desc "Seed database models from .csv files"
#   task :import_csv [:filename] => :environment do
#     CSV.foreach('/data/customers.csv', :headers => true) do |row|
#       Customer.create!(row.to_hash)
#   end
# end
