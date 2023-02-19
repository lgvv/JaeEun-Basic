//
//  FlowerRepository.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/19.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation
import CurationNetworking
import Models

final class FlowerRepositoryImpl {
    
    private let network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol = NetworkService()) {
        self.network = network
    }
    
    func fetchAllFlower() {
        network.request(GetFlowerAPI()) { it in
            print("it")
        }
    }
}
