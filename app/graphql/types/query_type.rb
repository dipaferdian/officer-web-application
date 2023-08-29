module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :officers, [Types::Officers::OfficerType], 'Get Officer by page params' do
      argument :page, Integer
    end

    # field :ranks, [Types::Rank::RankType]

    def officers(page:)

      if page <= 0
        return []
      end

      Officer.left_joins(:rank).paginate_by_sql(['select officers.id, officers.name from officers order by id asc'], :page => page, :per_page => 2)
    end

  end
end
