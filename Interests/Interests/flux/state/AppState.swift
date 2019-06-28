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
        moviesState = MoviesReducer().reduce(state: moviesState, action: action)
        castsState = CastsReducer().reduce(state: castsState, action: action)
        DispatchQueue.main.async {
            self.didChange.send(self)
        }
    }
}


let store = AppState()
let sampleStore = AppState(moviesState: MoviesState(movies: [0: sampleMovie],
                                                    recommanded: [0: [0]],
                                                    similar: [0: [0]],
                                                    popular: [0],
                                                    topRated: [0],
                                                    upcoming: [0]),
                           castsState: CastsState())
