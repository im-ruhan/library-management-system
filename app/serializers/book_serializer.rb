class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :isbn, :title, :author
end
