class Poll < ApplicationRecord
  validates :name, uniqueness: true
end
