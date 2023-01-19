//
//  PoliticianRepsitory.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import Foundation
import RxSwift

protocol PoliticianRepsitory {
    func getAllPolitician() -> Observable<[Politician.Mayor.Infomation]>
}

final public class PoliticianRepsitoryImpl: PoliticianRepsitory {
    private let service: UJeongSDKService
    
    init(_ service: UJeongSDKService = UJeongSDKService()) {
        self.service = service
    }
    
    func getAllPolitician() -> Observable<[Politician.Mayor.Infomation]> {
        let result = service.getAllPolitician()
        return Observable.just(result)
    }
}
