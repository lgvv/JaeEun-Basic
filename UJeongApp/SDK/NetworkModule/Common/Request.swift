//
//  Request.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import Foundation

protocol Request {
    func urlRequst(baseURL: URL) -> URLRequest?
    
    var key: String { get }
}

protocol Respondable {
    associatedtype ResponseType: Decodable
}

protocol OnlyRequestable {
    
}
