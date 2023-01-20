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
            let gu: Gu
            let name: String
            let party: Party
            let imageUrlString: String
            
            enum CodingKeys: String, CodingKey {
                case gu, name, party
                case imageUrlString = "image_url"
            }
        }
    }
}

