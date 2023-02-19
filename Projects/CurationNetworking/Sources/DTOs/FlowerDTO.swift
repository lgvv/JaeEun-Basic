//
//  FlowerDTO.swift
//  CurationNetworking
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

extension DTO {
    public struct Flower: Codable {
        public var id: Int
        public var name: String
        public var thumbnailUrlString: String
        public var floriography: String
        public var story: String
        public var othersUrlString: [String]
        
        enum CodingKeys: String, CodingKey {
            case id = "flower_id"
            case name = "flower_name"
            case thumbnailUrlString = "flower_profile_img_url"
            case floriography = "flower_floriography"
            case story = "flower_story"
            case othersUrlString = "flower_pictures_url"
        }
    }
}
