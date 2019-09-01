module Types
  class PollType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :candidates, [Types::CandidateType], null: true
    field :rules, [Types::RuleType], null: true
  end
end
