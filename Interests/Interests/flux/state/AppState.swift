//
//  AppState.swift
//  Interests
//
//  Created by apple on 2019/6/27.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class AppState: BindableObject {
    var didChange = PassthroughSubject<AppState, Never>()
    var moviesState: MoviesState
    var castsState: CastsState
    
    init(moviesState: MoviesState = MoviesState(), castsState: CastsState = CastsState()) {
        self.moviesState = moviesState
        self.castsState = castsState
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.didChange.send(self)
        }
    }
}


let store = AppState()
