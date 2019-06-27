//
//  MovieState.swift
//  Interests
//
//  Created by apple on 2019/6/27.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation

struct MoviesState: FluxState {
    var movies: [Int: Movie] = [:]
    var recommanded: [Int: [Int]] = [:]
    var similar: [Int: [Int ]] = [:]
    var popular: [Int] = []
    var topRated: [Int] = []
    var upcoming: [Int] = []
    var search: [String: [Int]] = [:]
    
    var wishlist: Set<Int> = Set()
    var seenlist: Set<Int> = Set()
}
