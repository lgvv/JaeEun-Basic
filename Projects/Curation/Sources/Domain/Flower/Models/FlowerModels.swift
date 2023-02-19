//
//  FlowerModels.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

enum FlowerModels {
    enum FetchFlowerList {
        struct Reponse {
            var id: Int
            var name: String
            var thumbnailUrlString: String
            var floriography: String
            var story: String
            var othersUrlStrings: [String]
        }
    }
}
