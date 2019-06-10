class QuizmoSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

end
