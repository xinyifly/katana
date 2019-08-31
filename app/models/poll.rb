class Poll < ApplicationRecord
  has_many :candidates, dependent: :destroy

  validates :name, uniqueness: true
end
