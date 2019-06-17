//
//  MovieAPI.swift
//  Interests
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import Moya

let movieProvider = MoyaProvider<Movie>()

public enum Movie {
    case getInTheaters
}

extension Movie: TargetType {
    /// The target's base `URL`.
    public var baseURL: URL { return URL(string: "https://douban.uieee.com")! }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        switch self {
        case .getInTheaters:
            return "/v2/movie/in_theaters"
        }
    }
    
    /// The HTTP method used in the request.
    public var method: Moya.Method {
        switch self {
        case .getInTheaters:
            return .get
            
        }
    }
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        switch self {
        case .getInTheaters:
            return Data()
            
        }
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
