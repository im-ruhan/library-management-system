class Borrower < ApplicationRecord
  belongs_to :library
  has_many :borrowings
  has_many :fines
end
