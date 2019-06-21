//
//  Movie.swift
//  Interests
//
//  Created by apple on 2019/6/20.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI


struct Movie: Codable, Identifiable {
    let id: Int
    let original_title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let popularity: Float
    let vote_average: Float
    let vote_count: Int
    let release_date: String
    
    let runtime: Int?
    let status: String?
    
}

let sampleMovie = Movie(id: 0,
                        original_title: "Test movie",
                        overview: "Test desc",
                        poster_path: "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
                        backdrop_path: "/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg",
                        popularity: 50.5,
                        vote_average: 8.9,
                        vote_count: 1000,
                        release_date: "1972-03-14",
                        runtime: 80,
                        status: "released")
