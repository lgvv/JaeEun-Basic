//
//  UJeongSDK.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/12.
//

import Foundation

protocol UJeongSDKServiceProtocol {
    var selectedLocation: String { get set }
}

// Interface의 역할

public class UJeongSDKService: UJeongSDKServiceProtocol {
    private let main: UJeongMain = {
        // 마이그레이션 작업 가능.
        return UJeongMain()
    }()
    
    // MARK: - AppStorageService
    
    var selectedLocation: String {
        get { main.appStorageService.selectedLocation }
        set { main.appStorageService.selectedLocation = newValue }
    }
    
    // MARK: - LocalStringFileService
    
    func getAllPolitician() -> [Politician.Mayor.Infomation] {
        return main.localStringFileServivce.getAllPolitician()
    }
}
