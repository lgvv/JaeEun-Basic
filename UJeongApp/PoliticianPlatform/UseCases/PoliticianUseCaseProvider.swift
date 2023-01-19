//
//  PoliticianUseCaseProvider.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import Foundation

public final class PoliticianUseCaseProvider {
    private let politicianRepository: PoliticianRepsitory
    
    init() {
        self.politicianRepository = PoliticianRepsitoryImpl()
    }
    
    func makePoliticianUseCase() -> PoliticianUseCase {
        return PoliticianUseCaseImpl(repository: politicianRepository)
    }
}


