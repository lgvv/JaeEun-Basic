//
//  UJeongMain.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/12.
//

import Foundation

class UJeongMain {
    var appStorageService: AppStorageServiceProtocol
    
    init() {
        self.appStorageService = AppStorageService()
    }
}
