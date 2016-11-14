require 'rails_helper'

RSpec.describe BatchesController, :type => :controller do
  before :each do
    @file = fixture_file_upload('spec/support/fixtures/one_sale.txt', 'text/tab-separated-values')
    @empty_file = fixture_file_upload('spec/support/fixtures/empty.txt', 'text/tab-separated-values')
  end
  describe "POST #create" do
    context "with valid attributes" do
      subject { post :create, file: @file }
      it "saves the sale in the database" do
        expect { subject }.to change(Sale, :count).by(1)
      end
      it "redirects to the home page" do
        expect(subject).to redirect_to(root_path)
      end
    end
    
    context "with an empty file" do
      subject { post :create, file: @empty_file }
      it "does not save the new batch in the database" do
        expect { subject }.to_not change{Batch.count}
      end
      it "re-renders the :new template" do
        expect(subject).to render_template(:new)
      end
    end
  end
end
