class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def self.find_merchant(search_name)
    Merchant.where('lower(name) like ?', "%" + search_name.downcase + "%").first
  end
end
