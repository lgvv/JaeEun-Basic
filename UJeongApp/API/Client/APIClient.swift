//
//  APIClient.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import Foundation
import RxSwift

final class APIClient {
    static let urlString = {
        return "https://api.github.com"
    }()
    
    enum Method {
        case post
        case get
        case delete
        case put
        
        var stringValue: String {
            switch self {
            case .post: return "POST"
            case .get: return "GET"
            case .delete: return "DELETE"
            case .put: return "PUT"
            }
        }
    }
    
    enum APIError: Error {
        case noAPIKey
        case invalidURLRequest
        case noDataFromResponse
        case failedToRequest
        case failedToDecodeResponse
        case statusCode(_ statusCode: Int)
    }
    
    private(set) var apiKey: String?
    let baseURL: URL
    
    init(urlString: String = APIClient.urlString) {
        guard let baseURL = URL(string: urlString) else {
            fatalError("Failed to create URL from \(urlString)")
        }
        self.baseURL = baseURL
    }
    
    private func send(_ request: Request & OnlyRequestable, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        
        guard var urlRequest = request.urlRequst(baseURL: baseURL) else {
            resultHandler(.failure(APIError.invalidURLRequest))
            return
        }
        
        urlRequest.addValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                resultHandler(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                resultHandler(.failure(APIError.failedToRequest))
                return
            }
            
            resultHandler(.success(()))
        }
        .resume()
    }
    
    private func send<RequestType: Request & Respondable>(_ request: RequestType, resultHandler: @escaping (Result<RequestType.ResponseType, Error>) -> Void) {
        
        guard var urlRequest = request.urlRequst(baseURL: baseURL) else {
            resultHandler(.failure(APIError.invalidURLRequest))
            return
        }
        
        urlRequest.addValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                resultHandler(.failure(error))
                return
            }
            guard let data = data else {
                resultHandler(.failure(APIError.noDataFromResponse))
                return
            }
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
                resultHandler(.failure(APIError.failedToRequest))
                return
            }
            
            guard let output = try? JSONDecoder().decode(RequestType.ResponseType.self, from: data) else {
                resultHandler(.failure(APIError.failedToDecodeResponse))
                return
            }
            resultHandler(.success(output))
        }
        .resume()
    }
    
    func fetchWithRx<RequestType: Request & Respondable>(_ request: RequestType) -> Observable<RequestType.ResponseType> {
        return Observable.create { emitter in
            self.send(request) { result in
                switch result {
                case .success(let response):
                    emitter.onNext(response)
                case .failure(let error):
                    emitter.onError(error)
                }
                
            }
            return Disposables.create()
        }
    }
}
