//
//  ImageService.swift
//  Interests
//
//  Created by apple on 2019/6/18.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import SwiftUI

class ImageService {
    static let shared = ImageService()
    private static let queue = DispatchQueue(label: "Image queue", qos: DispatchQoS.userInitiated)
    private var memcache: [String: UIImage] = [:]
    
    func purgeCache() {
        memcache.removeAll()
    }
    

}
