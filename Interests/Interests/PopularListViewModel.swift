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
    var searchText = ""
    var didChange = PassthroughSubject<PopularListViewModel, Never>()
    
    var movieList: [Int]
    var title: String?
    var popularMovies: MoviePageResponse<MovieSubject>?
    var movieSubjectList: [MovieSubject] {
        if self.popularMovies != nil {
            return self.popularMovies!.subjects
        } else {
            return []
        }
    }
    init() {
        movieList = []
    }
    
    
    func fetchMovie() {
        movieProvider.request(.fetchPopular) { result in
            if case let .success(response) = result {
                print(response)
                let data = response.data
                
    
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let movieResponse = try? decoder.decode(MoviePageResponse<MovieSubject>.self, from: data) else {
                    return
                }
                if self.popularMovies != nil {
                    self.popularMovies?.subjects.append(contentsOf: movieResponse.subjects)
                } else {
                    self.popularMovies = movieResponse
                }
                self.didChange.send(self)
                print(movieResponse)
            }
        }
    }
    
}
