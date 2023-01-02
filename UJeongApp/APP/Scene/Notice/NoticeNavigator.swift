//
//  NoticeNavigator.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit
import SwiftUI

protocol NoticeNavigator {
    func toNotice()
    func toNoticeDetail()
    func toLocationSetting()
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
        let vm = NoticeViewModel(useCase: services.makeNoticeUseCase(), navigator: self)
        let vc = NoticeViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toNoticeDetail() { }
    
    func toLocationSetting() {
        let view = LocationSettingView()
        let vc = UIHostingController(rootView: view)
        
        navigationController.present(vc, animated: true, completion: nil)
    }
}

