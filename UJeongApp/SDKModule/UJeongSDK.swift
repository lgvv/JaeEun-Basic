//
//  UJeongSDK.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/12.
//

import Foundation

// TCA의 Dependency를 지원하기 위해서는 작업이 필요할 듯 싶습니다.

protocol UJeongSDKServiceProtocol {
    var selectedLocation: String { get set }
}

public struct UJeongSDKServiceInTCA: UJeongSDKServiceProtocol, Sendable {
    static let sdkService = UJeongSDKService()
    
    var selectedLocation: String = ""
}

// Interface의 역할

public class UJeongSDKService: UJeongSDKServiceProtocol {
    private let main: UJeongMain = {
        // 마이그레이션 작업 가능.
        return UJeongMain()
    }()
    
    // MARK: - AppStorage
    var selectedLocation: String {
        get { main.appStorageService.selectedLocation }
        set { main.appStorageService.selectedLocation = newValue }
    }
}
