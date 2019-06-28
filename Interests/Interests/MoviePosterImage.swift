//
//  MoviePosterImage.swift
//  Interests
//
//  Created by apple on 2019/6/28.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI

struct MoviePosterImage : View {
    @State var imageLoader: ImageLoader
    @State var isImageLoaded = false
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .frame(width: 100, height: 150)
                    .cornerRadius(5)
                    .opacity(self.isImageLoaded ? 1 : 0.1)
                    .shadow(radius: 8)
                    .animation(.basic())
                    .onAppear{
                        self.isImageLoaded = true
                }
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 150)
                    .cornerRadius(5)
                    .shadow(radius: 8)
                    .opacity(0.1)
            }
            }.onAppear {
                self.imageLoader.loadImage()
        }
    }
}

