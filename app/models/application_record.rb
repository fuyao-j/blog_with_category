class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
class NameValidator < ActiveModel::Validator
  def validate(record)
    if ( !record.name.match(/[A-Z]{1}[a-z.]{1,} [A-Za-z.]{2,}/)  )
      record.errors[:base] << "Incorrect name"
    end
  end
end

class AuthorValidator < ActiveModel::Validator
  def validate(record)
    if ( !record.author.match(/[A-Z]{1}[a-z]{1,} [A-Z]{1}[A-Za-z.]{1,}/)  )
      record.errors[:base] << "Incorrect name"
    end
  end
end