//
//  PoliticianRepsitory.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import Foundation
import RxSwift

protocol PoliticianRepsitory {
    func getPoliticians() -> Observable<Politician>
}

final public class PoliticianRepsitoryImpl: PoliticianRepsitory {
    private let apiClient: APIClient

    init(_ apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getPoliticians() -> Observable<Politician> {
        
        return .empty()
    }
}
