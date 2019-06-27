//
//  MovieActions.swift
//  Interests
//
//  Created by apple on 2019/6/21.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import Moya



struct MovieAction {

    struct PoplularAction:Action {
        init() {
            movieProvider.request(.fetchPopular) { result in
                
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(PaginatedResponse<Movie>.self)
                    store.dispatch(action: SetPopular(response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct SetPopular: Action {
        let response: PaginatedResponse<Movie>
    }
    
    struct FetchTopRated: Action {
        init() {
            movieProvider.request(.fetchTopRated) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(PaginatedResponse<Movie>.self)
                    store.dispatch(action: SetTopRated(response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct FetchUpcoming: Action {
        init() {
            movieProvider.request(.fetchUpcoming, completion: <#T##Completion##Completion##(Result<Response, MoyaError>) -> Void#>)
            APIService.shared.GET(endpoint: .upcoming, params: ["region": "US"]) {
                (result: Result<PaginatedResponse<Movie>, APIService.APIError>) in
                switch result {
                case let .success(response):
                    store.dispatch(action: SetUpcoming(response: response))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct SetUpcoming: Action {
        let response: PaginatedResponse<Movie>
    }
    
    struct SetTopRated: Action {
        let response: PaginatedResponse<Movie>
    }
    
    struct SetSearch: Action {
        let query: String
        let response: PaginatedResponse<Movie>
    }
    
    struct addToWishlist: Action {
        let movie: Int
    }
    
    struct removeFromWishlist: Action {
        let movie: Int
    }
    
    struct addToSeenlist: Action {
        let movie: Int
    }
    
    struct removeFromSeenlist: Action {
        let movie: Int
    }
}
