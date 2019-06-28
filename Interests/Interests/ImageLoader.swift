//
//  ImageLoader.swift
//  Interests
//
//  Created by apple on 2019/6/28.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ImageLoader: BindableObject {
    let didChange = PassthroughSubject<UIImage?, Never>()
    
    let poster: String?
    let size: ImageService.Size
    
    var image: UIImage? = nil {
        didSet {
            didChange.send(image)
        }
    }
    
    init(poster: String?, size: ImageService.Size) {
        self.size = size
        self.poster = poster
    }
    
    func loadImage() {
        guard let poster = poster else {
            return
        }
        ImageService.shared.image(poster: poster, size: .medium) { (result) in
            do { self.image = try result.get() } catch { }
        }
    }
}
