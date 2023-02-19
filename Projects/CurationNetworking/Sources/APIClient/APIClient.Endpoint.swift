//
//  APIClient.Endpoint.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

extension APIClient {
    /// 엔드포인트를 관리.
    public enum Endpoint: APIEndpoint {
        /// 엔드포인트에 공통으로 사용되는 URL 값
        public static let baseURL = "https://api.curation.kr/\(APIClient.shared.apiVersion)"
        
        /// flower 리스트
        case flowers
        
        /// 엔드포인트 별 `URI` 값
        var uriString: String {
            switch self {
            case .flowers:
                return "\(Endpoint.baseURL)/flowers"
            }
        }
        
        /// 엔드포인트 별 HTTP 메소드 값
        var method: APIMethod {
            switch self {
            case .flowers:
                return .get
            }
        }
    }
}

protocol APIEndpoint {
    var uriString: String { get }
    
    var method: APIMethod { get }
}
