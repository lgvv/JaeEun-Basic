//
//  ServiceAPI.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

public protocol ServiceAPI {
    associatedtype Response: Decodable
    
    var endpoint: APIEndpoint { get set }
}
