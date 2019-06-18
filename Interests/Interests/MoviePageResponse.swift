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
    var large: String?
    var medium: String?
    var small: String?
}

struct MovieCast: Codable {
    var alt: String?
    var avatars: AvatarsSize?
    var id: String?
    var name: String?
    var name_en: String?
}

struct MovieRating: Codable {
    var average: Float
    var details: [Int: Int]
    var max: Int
    var min: Int
    var stars: String?
}

struct MovieSubject: Codable, Identifiable {
    var rating: MovieRating
    var genres: [String]
    var title: String?
    var casts: [MovieCast]

    var durations: [String]

    var collectCount: Int

    var mainlandPubdate: String

    var hasVideo: Bool

    var originalTitle: String

    var subtype: String

    var directors: [MovieCast]

    var pubdates: [String]
    var year: String

    var images: AvatarsSize

    var alt: String?

    var id: String

}



class MoviePageResponse<T: Codable>: Codable {
    var title: String?
    var total: Int?
    var count: Int?
    var start: Int?
    var subjects: [T]
}
