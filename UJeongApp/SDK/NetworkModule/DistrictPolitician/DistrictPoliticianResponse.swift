//
//  DistrictPoliticianResponse.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import Foundation

struct DistrictPoliticianResponse: Response, Decodable {
    typealias RequestType = DistrictPoliticianRequest
    
    var status: Int
    var message: String
    var data: [Politician]
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        data = try container.decode([Politician].self, forKey: .data)
    }
}
