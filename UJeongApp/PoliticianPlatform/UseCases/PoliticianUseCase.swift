//
//  PoliticianUseCase.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import Foundation
import RxSwift

protocol PoliticianUseCase {
    func fetchAllPolitician() -> Observable<[Politician.Mayor.Infomation]>
}

final class PoliticianUseCaseImpl: PoliticianUseCase {
    private let repository: PoliticianRepsitory
    
    init(repository: PoliticianRepsitory) {
        self.repository = repository
    }

    func fetchAllPolitician() -> Observable<[Politician.Mayor.Infomation]> {
        return repository.getAllPolitician()
    }
}
