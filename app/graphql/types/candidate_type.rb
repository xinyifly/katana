module Types
  class CandidateType < Types::BaseObject
    field :id, Integer, null: false
    field :user, Types::UserType, null: false
    field :poll, Types::PollType, null: false
    field :votes, [Types::VoteType], null: true
  end
end
