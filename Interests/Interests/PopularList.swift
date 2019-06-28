//
//  PopularList.swift
//  Interests
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct PopularList : View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        NavigationView {
            MoviesList(movies: state.moviesState.popular)
                .navigationBarTitle(Text("Popular"))
            }.onAppear {
                store.dispatch(action: MoviesActions.FetchPopular())
        }
    }
}

#if DEBUG
struct PopularList_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularList().environmentObject(sampleStore)
        }
    }
}
#endif

