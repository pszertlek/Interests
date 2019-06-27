//
//  Action.swift
//  Interests
//
//  Created by apple on 2019/6/27.
//  Copyright © 2019 Pszertlek.com.cn. All rights reserved.
//

import Foundation
import Moya

protocol Action {
    
}

extension Action {
    func transform<T: Decodable>(type: T.Type, _ result: Result<Moya.Response, MoyaError>) -> Result<T,MoyaError> {
        switch result {
        case .success(let response):
            let decoder = JSONDecoder()
            if let model = try? decoder.decode(T.self, from: response.data) {
                return Result<T,MoyaError>.success(model)
            } else {
                let error = MoyaError.jsonMapping(response)
                return Result<T,MoyaError>.failure(error)
            }
        case .failure(let error):
            return Result<T,MoyaError>.failure(error)
        }
    }
}
