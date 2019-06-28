//
//  TopRatedList.swift
//  Interests
//
//  Created by apple on 2019/6/28.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct TopRatedList : View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        NavigationView {
            MoviesList(movies: state.moviesState.topRated)
                .navigationBarTitle(Text("Top Rated"))
            }.onAppear {
                store.dispatch(action: MoviesActions.FetchTopRated())
        }
    }
}

#if DEBUG
struct TopRatedList_Previews : PreviewProvider {
    static var previews: some View {
        TopRatedList().environmentObject(sampleStore)
    }
}
#endif
