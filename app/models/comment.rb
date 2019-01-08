class Comment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  validates :content, presence: true
  validates_with AuthorValidator
end
