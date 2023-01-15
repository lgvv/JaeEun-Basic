//
//  DistrictPoliticianRequest.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import Foundation

struct DistrictPoliticianRequest: Request, Respondable {
    typealias ResponseType = DistrictPoliticianResponse
    
    let method: APIClient.Method = .get
    
    var key: String { "politician/district" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        urlRequest.addValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
