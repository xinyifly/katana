class Vote < ApplicationRecord
  belongs_to :candidate
  belongs_to :voter, class_name: 'User'
end
