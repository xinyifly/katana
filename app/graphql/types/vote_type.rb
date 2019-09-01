module Types
  class VoteType < Types::BaseObject
    field :id, Integer, null: false
    field :candidate, Types::CandidateType, null: false
    field :voter, Types::UserType, null: false
  end
end
