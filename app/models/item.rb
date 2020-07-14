class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_item(item_name)
    where('lower(name) like ?', "%" + item_name.downcase + "%").first
  end

  def self.find_items(item_name)
    where('lower(name) like ?', "%" + item_name.downcase + "%")
  end
end
