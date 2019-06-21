//
//  PaginatedResponse.swift
//  Interests
//
//  Created by apple on 2019/6/21.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation

struct PaginatedResponse<T: Codable>: Codable {
    let page: Int?
    let total_results: Int?
    let total_pages: Int?
    let results: [T]
}
