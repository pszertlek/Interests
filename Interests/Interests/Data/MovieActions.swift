//
//  MovieActions.swift
//  Interests
//
//  Created by apple on 2019/6/21.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation

struct MovieAction {
    struct PoplularAction {
        init() {
            movieProvider.request(.fetchPopular) { result in
                switch result {
                case let .success(response):
                    print("success")
                    guard let result = try? response.map(PaginatedResponse<Movie>.self) else {
                        return
                    }
                    MovieStore.shared.popularList = result.results
                case let .failure(error):
                        print("ss")
                }
            }
        }
    }
}
