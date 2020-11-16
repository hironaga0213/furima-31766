FactoryBot.define do
  factory :purchase_address do
    token               {"tok_2b7cd61e4858d92c99ea0c342dbc"}
    postal_code         {"150-0041"}
    prefecture_id       {14}
    municipality        {"渋谷区"}
    house_number        {"神南１丁目１８−２"}
    building            {"フレーム神南坂 4階"}
    phone_number        {"05031873522"}
    user_id             {2}
    item_id             {13}
  end
end
