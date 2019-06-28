//
//  CastsActions.swift
//  Interests
//
//  Created by apple on 2019/6/27.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation

struct CastsActions {
    struct FetchMovieCasts: Action {
        init(movie: Int) {
            movieProvider.request(.credits(movie: movie)) { result in
                switch result {
                case let .success(response):
                    let responseObject = try! response.map(CastResponse.self)
                    store.dispatch(action: SetMovieCasts(movie: movie, response: responseObject))
                case .failure(_):
                    break
                }
            }
        }
    }
    
    struct SetMovieCasts: Action {
        let movie: Int
        let response: CastResponse
    }
}
