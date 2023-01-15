//
//  UJeongMain.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/12.
//

import Foundation

class UJeongMain {
    let apiClient: APIClient
    var appStorageService: AppStorageServiceProtocol
    
    init() {
        self.apiClient = APIClient()
        self.appStorageService = AppStorageService()
    }
}
