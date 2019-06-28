//
//  MovieActions.swift
//  Interests
//
//  Created by apple on 2019/6/21.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import Moya



struct MoviesActions {

    struct FetchPopular: Action {
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
            movieProvider.request(.fetchUpcoming(region: "US")) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(PaginatedResponse<Movie>.self)
                    store.dispatch(action: SetUpcoming(response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct SetUpcoming: Action {
        let response: PaginatedResponse<Movie>
    }
    
    struct FetchDetail: Action {
        init(movie: Int) {
            movieProvider.request(.fetchDetail(movie: movie)) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(Movie.self)
                    store.dispatch(action: SetDetail(movie: movie, response: responseObject))
                case .failure(_):
                    break;
                }
            }
        }
    }
    
    struct SetDetail: Action {
        let movie: Int
        let response: Movie
    }
    
    struct FetchRecommanded: Action {
        init(movie: Int) {
            movieProvider.request(.fetchRecommanded(movie: movie)) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(PaginatedResponse<Movie>.self)
                    store.dispatch(action: SetRecommanded(movie: movie, response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct SetRecommanded: Action {
        let movie: Int
        let response: PaginatedResponse<Movie>
    }
    
    struct FetchSimilar: Action {
        init(movie: Int) {
            movieProvider.request(.fetchSimilar(movie: movie)) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(PaginatedResponse<Movie>.self)
                    store.dispatch(action: SetSimilar(movie: movie, response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct SetSimilar: Action {
        let movie: Int
        let response: PaginatedResponse<Movie>
    }
    
    struct FetchSearch: Action {
        init(query: String) {
            movieProvider.request(.fetchSearch(query: query)) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(PaginatedResponse<Movie>.self)
                    store.dispatch(action: SetSearch(query: query, response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
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
