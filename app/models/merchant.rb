class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def self.find_merchant(search_name)
    Merchant.where('lower(name) like ?', "%" + search_name.downcase + "%").first
  end

  def self.find_merchants(search_name)
    Merchant.where('lower(name) like ?', "%" + search_name.downcase + "%")
  end

  def self.most_revenue(quantity)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue')
    .joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: 'success'})
    .group('merchants.id')
    .order('total_revenue DESC')
    .limit("#{quantity}")
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions])
   .where(transactions: {result: "success"})
   .group(:id)
   .select("merchants.*, SUM(invoice_items.quantity) AS sum_quantity")
   .order('sum_quantity DESC')
   .limit(quantity)
  end
end
