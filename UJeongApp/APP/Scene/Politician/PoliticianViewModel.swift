//
//  PoliticianViewModel.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import Foundation

final class PoliticianViewModel: ViewModelType {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    private let useCase: PoliticianUseCase
    private let navigator: PoliticianNavigator
    
    init(useCase: PoliticianUseCase, navigator: PoliticianNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
    
}
