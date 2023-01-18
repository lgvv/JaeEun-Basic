//
//  Policician.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import Foundation

struct Politician: Codable {
    let mayor: Mayor
    
    // MARK: - Mayor
    struct Mayor: Codable {
        let seoul: [Infomation]
        
        // MARK: - Busan
        struct Infomation: Codable {
            let gu, name: String
            let party: Party
            let imageURL: String
            
            enum CodingKeys: String, CodingKey {
                case gu, name, party
                case imageURL = "image_url"
            }
        }
    }
}

