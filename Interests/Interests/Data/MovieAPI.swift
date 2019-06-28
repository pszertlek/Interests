//
//  MovieAPI.swift
//  Interests
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import Moya

let movieProvider = MoyaProvider<MovieAPI>()

public enum MovieAPI {
    case getInTheaters
    case fetchPopular
    case fetchTopRated
    case fetchUpcoming(region: String)
    case fetchDetail(movie: Int)
    case fetchRecommanded(movie: Int)
    case fetchSimilar(movie: Int)
    case credits(movie: Int)
    case fetchSearch(query: String)
} 


extension MovieAPI: TargetType {
    /// The target's base `URL`.
    var apiKey: String { "1d9b898a212ea52e283351e521e17871"}

    public var baseURL: URL { return URL(string: "https://api.themoviedb.org/3")! }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        var path: String!
        switch self {
        case .getInTheaters:
            path = "/v2/movie/in_theaters"
        case .fetchPopular:
            path = "movie/popular"
        case .fetchTopRated:
            path = "movie/top_rated"
        case .fetchUpcoming(_):
            path = "movie/upcoming"
        case let .fetchDetail(movie):
            path = "movie/\(String(movie))"
        case let .fetchRecommanded(movie):
            path = "movie/\(String(movie))/recommendations"
        case let .fetchSimilar(movie):
            path = "movie/\(String(movie))/similar"
        case .fetchSearch:
            path = "search/movie"
        case let .credits(movie):
            path = "movie/\(String(movie))/credits"
        }
        return path
    }
    
    /// The HTTP method used in the request.
    public var method: Moya.Method {
        return .get

    }
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        return Data()
    }
    
    /// The type of HTTP task to be performed.
    public var task: Task {
        switch self {
        case .fetchUpcoming(let region):
            return .requestJSONEncodable(["region":region,"api_key":apiKey])
        default:
            return .requestCompositeData(bodyData: Data(), urlParameters: ["api_key":apiKey])
            return .requestJSONEncodable(["api_key":apiKey])
        }
        return .requestPlain
    }
    
    /// The type of validation to perform on the request. Default is `.none`.
    public var validationType: ValidationType {
        return .none
    }
    
    /// The headers to be used in the request.
    public var headers: [String: String]? {
        return nil
    }
    
    
}
