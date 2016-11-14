class Sale < ActiveRecord::Base
  belongs_to :batch
  validates :buyer, :description, :price, :quantity, :address, :supplier, presence: true

  self.per_page = 30
  def self.import(file)
    batch = Batch.new
    CSV.foreach(file.path, headers: true, col_sep: "\t", converters: [:all]) do |row|
      batch.sales.build(parse_input_sale(row))
    end
    
    batch.sales.present? and batch.save
  end

  private
  def self.parse_input_sale(input)
    {
      buyer: input["Comprador"], 
      description: input["descrição"], 
      price: input["Preço Uniário"], 
      quantity: input["Quantidade"], 
      address: input["Endereço"], 
      supplier: input["Fornecedor"]
    }
  end
end

