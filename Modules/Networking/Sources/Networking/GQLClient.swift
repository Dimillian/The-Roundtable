import Apollo
import Foundation

public struct GQLClient {
  private enum Constants {
    static let apiURL = URL(string: "https://eldenring.fanapis.com/api/graphql")!
  }
  
  public enum GQLError: Error {
    case serverError(error: Error)
    case missingData
  }
  
  static public let shared = GQLClient()
  
  private let apolloClient: ApolloClient
  
  private init() {
    let store = ApolloStore(cache: InMemoryNormalizedCache())
    let provider = DefaultInterceptorProvider(store: store)
    let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                 endpointURL: Constants.apiURL)
    self.apolloClient = ApolloClient(networkTransport: transport, store: store)
  }
  
  public func fetch<Query>(query: Query,
                           cachePolicy: CachePolicy = .returnCacheDataElseFetch)
  async throws -> Query.Data where Query: GraphQLQuery {
    try await withCheckedThrowingContinuation { continuation in
      var queryAlreadyCompletedOnce = false
      apolloClient.fetch(query: query, cachePolicy: cachePolicy) { result in
        guard !queryAlreadyCompletedOnce else { return }
        queryAlreadyCompletedOnce = true
        switch result {
        case let .failure(error):
          continuation.resume(throwing: GQLError.serverError(error: error))
        case let .success(successResult):
          guard let data = successResult.data else {
            continuation.resume(throwing: GQLError.missingData)
            return
          }
          continuation.resume(returning: data)
        }
      }
    }
  }
  
  public func mutate<Mutation>(mutation: Mutation) async throws -> Mutation.Data where Mutation: GraphQLMutation {
    try await withCheckedThrowingContinuation { continuation in
      apolloClient.perform(mutation: mutation) { result in
        switch result {
        case let .failure(error):
          continuation.resume(throwing: GQLError.serverError(error: error))
        case let .success(successResult):
          guard let data = successResult.data else {
            continuation.resume(throwing: GQLError.missingData)
            return
          }
          continuation.resume(returning: data)
        }
      }
    }
  }
}
