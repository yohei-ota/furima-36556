FactoryBot.define do
  factory :bought_log_bought_user do
    postal_code    {"123-4567"}
    area_id        {2}
    munucipalities {"京都市"}
    address        {"中京区1-1-1"}
    building       {"京都マンション"}
    phone_number   {"09012345678"}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end