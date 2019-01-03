class Category < ApplicationRecord
  has_many :posts
  validates :name, length: { minimum: 5 }
  validates_with NameValidator
end
