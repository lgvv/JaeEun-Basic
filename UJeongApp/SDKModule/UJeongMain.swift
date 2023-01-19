//
//  UJeongMain.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/12.
//

/*
 클린아키텍쳐 27장에서 서비스도 안티패턴이란 말이 나오는데,
 컴포넌트 단위로 제공하기 위해서 sdk - main 이런 고리가 필요하다고 판단된다.
 */

import Foundation

class UJeongMain {
    var appStorageService: AppStorageServiceProtocol
    var localStringFileServivce: LocalStringFileServiceProtocol
    
    init() {
        self.appStorageService = AppStorageService()
        self.localStringFileServivce = LocalStringFileService()
    }
}
