class BorrowerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :credit_card
end
