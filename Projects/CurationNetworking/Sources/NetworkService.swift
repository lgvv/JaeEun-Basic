//
//  NetworkService.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation
import RxSwift

public protocol NetworkServiceProtocol {
    func request<API>(_ api: API, completion: @escaping (API.Response) -> Void) where API : ServiceAPI
    func request<API>(_ api: API) -> Observable<API.Response> where API : ServiceAPI
}

public final class NetworkService: NetworkServiceProtocol {
    public init() { }
    
    public func request<API>(_ api: API, completion: @escaping (API.Response) -> Void) where API : ServiceAPI {
        APIClient.shared.request(api) { response in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
    
    /// Rx 기반으로 작성된 화면에서 사용하기 위한 request
    public func request<API>(_ api: API) -> Observable<API.Response> where API : ServiceAPI {
        return Observable.create { emitter in
            APIClient.shared.request(api) { response in
                emitter.onNext(response)
            }
            return Disposables.create()
        }
    }
}
