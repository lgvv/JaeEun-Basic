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
    var endpoint: APIClient.Endpoint { get set }
//    var method: String { get }
}

public final class APIClient {
    
    /// 싱글톤 객체
    static var shared = APIClient()
    /// API 통신 버전
    var apiVersion: String { "v1" }
    
    public func request<T: Codable>(
        endpoint: APIClient.Endpoint,
        completion: @escaping (T) -> Void
    ) {
        AF.request(endpoint.uriString,
                   method: endpoint.method.httpMethodValue,
                   parameters: nil,
                   headers: nil
        )
        .validate(statusCode: 200..<500)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result)
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    completion(result)
                } catch {
                    print("🚨 \(#function): decoing error")
                }
            case .failure(let error):
                print("🚨 \(#function): \(error.localizedDescription)")
            }
        }
    }
    
    public func send<T: Codable>(_ api: ServiceAPI, completion: @escaping (T) -> Void) {
        AF.request(api.endpoint.uriString,
                   method: api.endpoint.method.httpMethodValue
        )
        .validate(statusCode: 200..<500)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result)
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
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
