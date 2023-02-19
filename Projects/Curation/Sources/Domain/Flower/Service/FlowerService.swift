//
//  FlowerService.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

final class FlowerService {
    private let flowerRepository: FlowerRepository
    
    init(
        flowerRepository: FlowerRepository = FlowerRepositoryImpl()
    ) {
        self.flowerRepository = flowerRepository
    }
}
