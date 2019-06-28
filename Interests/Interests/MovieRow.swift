//
//  MovieRow.swift
//  Interests
//
//  Created by apple on 2019/6/20.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct MovieRow : View {
    @EnvironmentObject var state: AppState
    
    let movieId: Int
    var movie: Movie! {
        return state.moviesState.movies[movieId]
    }
    
    var body: some View {
        HStack {
            MoviePosterImage(imageLoader: ImageLoader(poster: movie.poster_path, size: .small))
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.original_title).bold()
                Text(movie.overview)
                    .color(.secondary)
                    .lineLimit(8)
                    .truncationMode(.tail)
                }.padding(.leading, 8)
            }.padding(8)
    }
}

#if DEBUG
struct MovieRow_Previews : PreviewProvider {
    static var previews: some View {
        List {
            MovieRow(movieId: sampleMovie.id).environmentObject(sampleStore)
        }
    }
}
#endif
