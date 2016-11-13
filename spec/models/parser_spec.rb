require 'rails_helper'

RSpec.describe Parser, :type => :model do
  subject { Parser.new(args.read) }
  let(:args) { double }
  let(:data) { "Comprador\tdescrição\tPreço Uniário\tQuantidade\tEndereço\tFornecedor\nJoão Silva\tR$10 off R$20 of food\t10.0\t2\t987 Fake St\tBob's Pizza" }
  
  before { allow(args).to receive(:read) { data } }

  it "can be instantiated" do
    expect(subject).to be_a(Parser)
  end

  describe "#to_h" do
    it "returns a hash " do
      expect(subject.to_h).to eq([{"Comprador"=>"João Silva", "descrição"=>"R$10 off R$20 of food", "Preço Uniário"=>10.0, "Quantidade"=>2, "Endereço"=>"987 Fake St", "Fornecedor"=>"Bob's Pizza"}])
    end
  end
end
