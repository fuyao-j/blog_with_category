class Category < ApplicationRecord
  has_many :posts
  has_many :comments, as: :parent
  validates :name, length: { minimum: 5 }
  validates_with NameValidator
end
