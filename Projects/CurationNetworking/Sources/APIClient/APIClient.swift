//
//  APIClient.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

public protocol ServiceAPI {
    associatedtype Response: Decodable
    
    var endpoint: APIClient.Endpoint { get set }
}

public final class APIClient {
    
    /// 싱글톤 객체
    static var shared = APIClient()
    /// API 통신 버전
    var apiVersion: String { "v1" }
    
    private init() { }
    
    /// api request
    public func request<API>(
        _ api: API,
        completion: @escaping (API.Response) -> Void) where API : ServiceAPI {
        AF.request(api.endpoint.uriString,
                   method: api.endpoint.method.httpMethodValue
        )
        .validate(statusCode: 200..<500)
        .responseDecodable(of: API.Response.self) { response in
            switch response.result {
            case .success(let result):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result)
                    let result = try JSONDecoder().decode(API.Response.self, from: jsonData)
                    completion(result)
                } catch {
                    print("🚨 \(#function): decoing error")
                }
            case .failure(let error):
                print("🚨 \(#function): \(error.localizedDescription)")
            }
        }
    }
}
