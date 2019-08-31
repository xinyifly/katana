class Rule < ApplicationRecord
  belongs_to :poll

  validates :key, uniqueness: { scope: :poll }
end
