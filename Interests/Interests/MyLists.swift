//
//  MyLists.swift
//  Interests
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct MyLists : View {
    @State var selectedList: Int = 0
    @EnvironmentObject var state: AppState
    
    var body: some View {
        NavigationView {
            List {
                SegmentedControl(selection: $selectedList) {
                    Text("Wishlist").tag(0)
                    Text("Seen").tag(1)
                }
                if selectedList == 0 {
                    ForEach(state.moviesState.wishlist.map{ $0.id }) {id in
                        NavigationButton(destination: MovieDetail(movieId: id)) {
                            MovieRow(movieId: id)
                        }
                        }
                        .onDelete { (index) in
                            let movie = self.state.moviesState.wishlist.map{ $0.id }[index.first!]
                            store.dispatch(action: MoviesActions.removeFromWishlist(movie: movie))
                            
                    }
                } else if selectedList == 1 {
                    ForEach(state.moviesState.seenlist.map{ $0.id }) {id in
                        NavigationButton(destination: MovieDetail(movieId: id)) {
                            MovieRow(movieId: id)
                        }
                        }
                        .onDelete { (index) in
                            let movie = self.state.moviesState.seenlist.map{ $0.id }[index.first!]
                            store.dispatch(action: MoviesActions.removeFromSeenlist(movie: movie))
                    }
                }
                }
                .navigationBarTitle(Text("My Lists"))
        }
    }
}

#if DEBUG
struct MyLists_Previews : PreviewProvider {
    static var previews: some View {
        MyLists(selectedList: 0)
    }
}
#endif
