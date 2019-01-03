class Post < ApplicationRecord
  belongs_to :category
  validates :category, presence: true
  validates :name, length: { minimum: 5 }
  validates_with NameValidator
end
