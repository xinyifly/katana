class Poll < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :rules, dependent: :destroy

  validates :name, uniqueness: true
end
