//
//  APIMethod.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation
import Alamofire

enum APIMethod {
    /// API 요청에 대한 HTTP 메소드를 정의.
    case delete
    case get
    case post
    case put
    
    /// Alamofire Method Value
    var httpMethodValue: HTTPMethod {
        switch self {
        case .delete: return .delete
        case .get: return .get
        case .post: return .post
        case .put: return .put
        }
    }
}
