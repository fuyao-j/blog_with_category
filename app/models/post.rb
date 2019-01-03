class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :parent
  validates :category, presence: true
  validates :name, length: { minimum: 5 }
  validates_with NameValidator
end
