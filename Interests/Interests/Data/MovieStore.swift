//
//  MovieStore.swift
//  Interests
//
//  Created by apple on 2019/6/21.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI

class MovieStore {
    static let shared = MovieStore()
    var popularList: [Movie] = []
}
