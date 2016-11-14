require 'rails_helper'

RSpec.describe Sale, :type => :model do
  let(:file) do
    extend ActionDispatch::TestProcess
    fixture_file_upload('spec/support/fixtures/dados.txt', 'text/tab-separated-values')
  end

  let(:typo_file) do
    extend ActionDispatch::TestProcess
    fixture_file_upload('spec/support/fixtures/typo.txt', 'text/tab-separated-values')
  end

  describe ".import" do
    context "with valid data" do
      subject { Sale.import(file) }

      it "saves the data on database" do
        expect { subject }.to change(Sale, :count).by(4)
      end
    end

    context "with typos on file" do
      subject { Sale.import(typo_file) }

      it "saves the data on database" do
        expect { subject }.to_not change{Sale.count}
      end
    end
  end
end
