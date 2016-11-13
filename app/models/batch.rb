class Batch < ActiveRecord::Base
  has_many :sales

  def total_revenue
    sales.reduce(0) {|total, sale| total + sale.price }
  end
end
