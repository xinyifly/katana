module Types
  class UserType < Types::BaseObject
    field :id, Integer, null: false
    field :email, String, null: false
    field :candidates, [Types::CandidateType], null: true
    field :votes, [Types::VoteType], null: true
  end
end
