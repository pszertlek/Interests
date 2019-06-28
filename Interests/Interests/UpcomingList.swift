//
//  UpcomingList.swift
//  Interests
//
//  Created by apple on 2019/6/28.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct UpcomingList : View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        NavigationView {
            MoviesList(movies: state.moviesState.upcoming)
                .navigationBarTitle(Text("Upcoming"))
            }.onAppear {
                store.dispatch(action: MoviesActions.FetchUpcoming())
        }
    }
}

#if DEBUG
struct LatestList_Previews : PreviewProvider {
    static var previews: some View {
        UpcomingList().environmentObject(sampleStore)
    }
}
#endif
