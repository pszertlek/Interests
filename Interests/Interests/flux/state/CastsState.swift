//
//  CastsState.swift
//  Interests
//
//  Created by apple on 2019/6/27.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation

struct CastsState: FluxState {
    var casts: [Int: Cast] = [:]
    var castsMovie: [Int: [Int]] = [:]
}
