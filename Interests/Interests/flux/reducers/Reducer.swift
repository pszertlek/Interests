//
//  Reducer.swift
//  Interests
//
//  Created by apple on 2019/6/27.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation

protocol Reducer {
    associatedtype StateType: FluxState
    func reduce(state: StateType, action: Action) -> StateType
}
