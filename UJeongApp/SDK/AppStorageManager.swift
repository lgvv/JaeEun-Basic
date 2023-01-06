//
//  AppStorageManager.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import SwiftUI

final class AppStorageKey {
    private static let baseString = "com.ujeong.world"
    
    static let selectedLocation: String = "\(baseString).selected.location"
}

final class AppStorageManager {
    @AppStorage(AppStorageKey.selectedLocation)
    var selectedLocation: String = Gu.강남구.rawValue
}
