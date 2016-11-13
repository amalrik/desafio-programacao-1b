require 'rails_helper'

RSpec.describe Batch, :type => :model do
  subject { create(:batch_with_sales) }

  describe "#total_revenue" do
    it "calculates to total revenue" do
      expect(subject.total_revenue).to eq(50.0)
    end
  end
end
