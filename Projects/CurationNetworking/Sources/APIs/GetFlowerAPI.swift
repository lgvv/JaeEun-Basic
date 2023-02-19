//
//  GetFlowerAPI.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

public struct GetFlowerAPI: ServiceAPI {
    public typealias Response = DTO.Flower
    
    public var endpoint = APIClient.Endpoint.flowers
}

class AA {
    let apiClient = APIClient()
    
    func ss() {
        apiClient.send(GetFlowerAPI()) { it in
            
        }
    }
}
