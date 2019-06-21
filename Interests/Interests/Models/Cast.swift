//
//  Cast.swift
//  Interests
//
//  Created by apple on 2019/6/21.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI

struct Cast: Codable, Identifiable {
    let id: Int
    let name: String
    let character: String?
    let department: String?
    let profile_path: String?
}

struct CastResponse: Codable {
    let id: Int
    let cast: [Cast]
    let crew: [Cast]
}

let sampleCasts = [Cast(id: 0, name: "Cast 1", character: "Character 1", department: nil, profile_path: nil),
                   Cast(id: 1, name: "Cast 2", character: nil, department: "Director 1", profile_path: nil)]

