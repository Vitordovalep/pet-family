class Species < ApplicationRecord
  has_many :breeds, dependent: :destroy
end
