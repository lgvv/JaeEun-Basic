//
//  PoliticianNavigator.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import UIKit

protocol PoliticianNavigator {
    func toPolitican()
}

class DefaultPoliticianNavigator: PoliticianNavigator {
    private let navigationController: UINavigationController
    private let services: PoliticianUseCaseProvider
    
    init(
        navigationController: UINavigationController,
        services: PoliticianUseCaseProvider
    ) {
        self.navigationController = navigationController
        self.services = services
    }
    
    func toPolitican() {
        let vm = PoliticianViewModel(useCase: services.makePoliticianUseCase(), navigator: self)
        let vc = PoliticianViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
