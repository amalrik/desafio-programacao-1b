FactoryGirl.define do
  factory :batch do
    
    factory :batch_with_sales do
      transient do
        sales_count 5
      end

      after(:create) do |batch, evaluator|
        create_list(:sale, evaluator.sales_count, batch: batch)
      end
    end
  end
end
