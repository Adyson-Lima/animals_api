class Animal < ApplicationRecord
  validates :name, :size, presence: true
end
