//
//  PopularListViewModel.swift
//  Interests
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class PopularListViewModel: BindableObject {
    var didChange = PassthroughSubject<PopularListViewModel, Never>()
    
    var movieList: [Int]
    var title: String?
    
    init() {
        movieList = []
    }
    
    func fetchMovie() {
        movieProvider.request(.getInTheaters) { result in
            if case let .success(response) = result {
                print(response)
                let data = response.data
                
    
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieResponse = try! decoder.decode(MoviePageResponse<MovieSubject>.self, from: data) 
//                    return
//                }
                self.title = movieResponse.title
                print(movieResponse)
                
            }
                
                
        }
    }
}
