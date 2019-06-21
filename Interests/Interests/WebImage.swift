//
//  WebImage.swift
//  Interests
//
//  Created by apple on 2019/6/18.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import SwiftUI
import Kingfisher


struct WebImage : SwiftUI.View {
    
    @State var load = false
    @State var url: URL
    @State var image: UIImage?
    @State var placeHolder: UIImage?
    var body: some SwiftUI.View {
        ZStack {
            if self.image != nil {
                SwiftUI.Image(uiImage: self.image!)
                    .resizable()
                    .frame(width: 100, height: 150)
                    .cornerRadius(5)
                    .shadow(radius: 8)
                    .animation(.basic())
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 150)
                    .cornerRadius(5)
                    .shadow(radius: 8)
                    .opacity(0.1)
            }
        }.onAppear(perform: loadImage)
    }
    

    
    func loadImage() {
        let resource = ImageResource(downloadURL: self.url)
        KingfisherManager.shared.retrieveImage(with: resource) { result in
            switch result {
            case .success(let retrive):
                self.image = retrive.image
                break
                
            case.failure(let error):
                print("failed\(error)")
                break
            }
        }
    }
    
    func loadsss() {
        print()
    }
    
}
//

#if DEBUG
struct WebImage_preview: PreviewProvider {
    static var previews: some SwiftUI.View {
        WebImage(url: URL(string: "http://cdn.cocimg.com/assets/images/logo.png?15018")!).previewLayout(PreviewLayout.fixed(width: 100, height: 150))
    }
}

#endif
