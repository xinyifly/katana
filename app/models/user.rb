class User < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_many :votes, foreign_key: 'voter_id', inverse_of: :voter, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    email
  end

  def vote(candidate)
    Vote.create(candidate: candidate, voter: self)
  end
end
