//
//  AppStorageService.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/12.
//

import Foundation
import SwiftUI

protocol AppStorageServiceProtocol {
    var selectedLocation: String { get set }
}

class AppStorageService: AppStorageServiceProtocol {
    @AppStorage(AppStorageKey.selectedLocation)
    var selectedLocation: String = Gu.강남구.rawValue
}

class AppStorageKey {
    private static let baseString = "com.ujeong.world"

    static let selectedLocation: String = "\(baseString).selected.location"
}
