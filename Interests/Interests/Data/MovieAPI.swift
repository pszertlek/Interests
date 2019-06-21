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
    case fetchUpcoming
    case fetchDetail(movie: Int)
    case fetchRecommanded(movie: Int)
    case fetchSimilar(movie: Int)
    case credits(movie: Int)
    case fetchSearch(query: String)
} 


extension MovieAPI: TargetType {
    /// The target's base `URL`.
    public var baseURL: URL { return URL(string: "https://api.themoviedb.org/3")! }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        switch self {
        case .getInTheaters:
            return "/v2/movie/in_theaters"
        case .fetchPopular:
            return "movie/popular"
        case .fetchTopRated:
            return "movie/top_rated"
        case .fetchUpcoming:
            return "movie/upcoming"
        case let .fetchDetail(movie):
            return "movie/\(String(movie))"
        case let .fetchRecommanded(movie):
            return "movie/\(String(movie))/recommendations"
        case let .fetchSimilar(movie):
            return "movie/\(String(movie))/similar"
        case .fetchSearch:
            return "search/movie"
        case let .credits(movie):
            return "movie/\(String(movie))/credits"
        }
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
