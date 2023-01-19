//
//  PoliticianViewModel.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import UIKit
import RxSwift
import RxCocoa

final class PoliticianViewModel: ViewModelType {
    struct Input {
        let fetchTrigger: Driver<Void>
    }
    
    struct Output {
        let politicians: Driver<[PoliticianSection]>
    }
    
    private let useCase: PoliticianUseCase
    private let navigator: PoliticianNavigator
    
    init(useCase: PoliticianUseCase, navigator: PoliticianNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let politicians = useCase.fetchAllPolitician()
            .map { infomation in
                self.convertToSection(from: infomation)
            }
            .debug("✅")
            .asDriver(onErrorJustReturn: [])
        
        
        return Output(politicians: politicians)
    }
    
    func convertToSection(from items: [Politician.Mayor.Infomation]) -> [PoliticianSection] {
        let cardItems: [PoliticianSectionItem] = items.map { politician in
            let viewModel = PoliticianCardCellViewModel(with: politician)
            return PoliticianSectionItem.politicianCardCell(viewModel)
        }
        
        let cardSection: PoliticianSection = PoliticianSection.politicianCardCell(cardItems)
        return [cardSection]
    }
}
