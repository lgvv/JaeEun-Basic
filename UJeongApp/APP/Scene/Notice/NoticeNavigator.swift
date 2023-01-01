//
//  NoticeNavigator.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit

protocol NoticeNavigator {
    func toNotice()
    func toNoticeDetail()
}

class DefaultNoticeNavigator: NoticeNavigator {
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(
        navigationController: UINavigationController,
        services: UseCaseProvider
    ) {
        self.navigationController = navigationController
        self.services = services
    }
    
    func toNotice() {
        let vc = NoticeViewController()
        vc.viewModel = NoticeViewModel(useCase: services.makeNoticeUseCase(), navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toNoticeDetail() { }
}

