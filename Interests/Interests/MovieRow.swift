//
//  MovieRow.swift
//  Interests
//
//  Created by apple on 2019/6/20.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI

struct MovieRow : View {
    @State var movie: Movie
    
    var body: some View {
        HStack {
            
            WebImage(url: URL(string: "https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super")!)
            Text(movie.original_title)
                .bold()

        }
    }
}

#if DEBUG
struct MovieRow_Previews : PreviewProvider {
    static var previews: some View {
        MovieRow(movie: sampleMovie).previewLayout(PreviewLayout.fixed(width: 300, height: 150))
    }
}
#endif
