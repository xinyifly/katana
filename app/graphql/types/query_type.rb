module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :viewer, Types::UserType, null: true

    def viewer
      context[:current_user]
    end

    field :polls, [Types::PollType], null: true

    def polls
      Poll.all
    end
  end
end
