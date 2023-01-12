//
//  Response.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import Foundation

protocol Response: Decodable {
    associatedtype RequestType: Request
    
    var status: Int { get }
    var message: String { get }
}
