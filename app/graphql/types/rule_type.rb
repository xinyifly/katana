module Types
  class RuleType < Types::BaseObject
    field :id, Integer, null: false
    field :poll, Types::PollType, null: false
    field :key, String, null: false
    field :value, String, null: false
  end
end
