//
//  MovieDetailRow.swift
//  Interests
//
//  Created by apple on 2019/6/28.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct MovieDetailRow : View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.leading)
            ScrollView(showsHorizontalIndicator: false) {
                HStack(spacing: 32) {
                    ForEach(self.movies) { movie in
                        MovieDetailRowItem(movie: movie)
                    }
                    }.padding(.leading)
            }
            }
            .listRowInsets(EdgeInsets())
            .padding(.top)
            .padding(.bottom)
    }
}

struct MovieDetailRowItem: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .center) {
            MoviePosterImage(imageLoader: ImageLoader(poster: movie.poster_path, size: .medium))
            NavigationButton(destination: MovieDetail(movieId: movie.id)) {
                Text(movie.original_title)
                    .font(.body)
                    .color(.primary)
                Text(movie.release_date.prefix(4))
                    .font(.subheadline)
                    .color(.secondary)
            }
            }.frame(width: 120)
    }
}

#if DEBUG
struct MovieDetailRow_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailRow(title: "Sample", movies: [sampleMovie, sampleMovie])
        }
    }
}
#endif
