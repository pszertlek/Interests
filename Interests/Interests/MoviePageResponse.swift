//
//  MoviePageList.swift
//  Interests
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI

struct AvatarsSize: Codable {
    var large: String
    var medium: String
    var small: String
}

struct MovieCast: Codable {
    var alt: String?
    var avatars: AvatarsSize
    var id: Int
    var name: String?
    var name_en: String?
}

struct MovieRating: Codable {
    var average: String
    var details: [Int: Int]
    var max: Int
    var min: Int
    var stars: Int
}

struct MovieSubject: Codable, Identifiable {
    var alt: String
    var id: String
    var casts: [MovieCast]
    var collectCount: Int
    var directors: [MovieCast]
    var durations: [String]
    var genres: [String]
    var has_video: Int
    var images: AvatarsSize
    var mainlandPubdate: String
    var originalTitle: String
    var pubdates: [String]
    var rating: MovieRating
    var subtype: String
    var title: String
    var year: Int
    
}



class MoviePageResponse<T: Codable>: Codable {
    var title: String?
    var total: Int?
    var count: Int?
    var start: Int?
    var subjects: [T]
}
