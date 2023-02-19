//
//  NetworkService.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

public protocol NetworkServiceProtocol {
    func request<API>(_ api: API, completion: @escaping (API.Response) -> Void) where API : ServiceAPI
}

public final class NetworkService {
    public init() { }
    
    public func request<API>(_ api: API, completion: @escaping (API.Response) -> Void) where API : ServiceAPI {
        APIClient.shared.request(api) { response in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
}
