//
//  MovieBackdrop.swift
//  Interests
//
//  Created by apple on 2019/6/28.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct MovieBackdrop: View {
    @EnvironmentObject var state: AppState
    @State var seeImage = false
    
    let movieId: Int
    var movie: Movie! {
        return state.moviesState.movies[movieId]
    }
    
    //MARK: - View computed properties
    
    var transition: AnyTransition {
        return AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
    }
    
    var animation: Animation {
        Animation.spring(initialVelocity: 2)
            .speed(2)
            .delay(0.5)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            MovieDetailImage(imageLoader: ImageLoader(poster: movie.backdrop_path,
                                                      size: .original),
                             isExpanded: $seeImage)
                .blur(radius: seeImage ? 0 : 10, opaque: true)
                .tapAction {
                    withAnimation{
                        self.seeImage.toggle()
                    }
            }
            if !seeImage {
                HStack {
                    VStack(alignment: .leading) {
                        Text(movie.original_title)
                            .fontWeight(.bold)
                            .font(.title)
                            .color(.white)
                            .lineLimit(nil)
                        HStack {
                            Text(movie.release_date.prefix(4))
                                .font(.subheadline)
                                .color(.white)
                            if movie.runtime != nil {
                                Text("• \(movie.runtime!) minutes")
                                    .font(.subheadline)
                                    .color(.white)
                                    .transition(transition)
                                    .animation(animation)
                            }
                            if movie.status != nil {
                                Text("• \(movie.status!)")
                                    .font(.subheadline)
                                    .color(.white)
                                    .transition(transition)
                                    .animation(animation)
                            }
                        }
                    }
                    }
                    .padding(.leading)
                    .padding(.bottom)
            }
            
            }.listRowInsets(EdgeInsets())
    }
}

struct MovieOverview : View {
    let movie: Movie
    @State var isOverviewExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Overview:").font(.headline)
            Text(movie.overview)
                .font(.subheadline)
                .color(.secondary)
                .lineLimit(self.isOverviewExpanded ? nil : 4)
                .tapAction {
                    withAnimation {
                        self.isOverviewExpanded.toggle()
                    }
            }
            Button(action: {
                withAnimation {
                    self.isOverviewExpanded.toggle()
                }
            }, label: {
                Text(self.isOverviewExpanded ? "Less" : "Read more")
                    .color(self.isOverviewExpanded ? .white : .blue)
            })
        }
    }
}

struct MovieDetailImage : View {
    @State var imageLoader: ImageLoader
    @State var isImageLoaded = false
    @Binding var isExpanded: Bool
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(500/300, contentMode: .fit)
                    .opacity(isImageLoaded ? 1 : 0)
                    .animation(.basic())
                    .onAppear{
                        self.isImageLoaded = true
                }
            } else {
                Rectangle()
                    .aspectRatio(500/300, contentMode: .fit)
                    .foregroundColor(.gray)
                    .opacity(0.1)
            }
            }.onAppear {
                self.imageLoader.loadImage()
        }
    }
}


#if DEBUG
struct MovieBackdrop_Previews : PreviewProvider {
    static var previews: some View {
        MovieBackdrop(movieId: sampleMovie.id).environmentObject(sampleStore)
    }
}
#endif

