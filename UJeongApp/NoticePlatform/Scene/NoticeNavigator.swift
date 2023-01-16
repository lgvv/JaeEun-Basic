//
//  NoticeNavigator.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit
import SwiftUI
import ComposableArchitecture

protocol NoticeNavigator {
    func toNotice()
    func toNoticeDetail()
    func toLocationSetting()
}

class DefaultNoticeNavigator: NoticeNavigator {
    private let navigationController: UINavigationController
    private let services: NoticeUseCaseProvider
    
    init(
        navigationController: UINavigationController,
        services: NoticeUseCaseProvider
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
        let reducer = LocationSettingCore()
        let view = LocationSettingView(store: StoreOf<LocationSettingView.Core>(initialState: .init(),
                                                                                reducer: reducer))
        let vc = UIHostingController(rootView: view)
        vc.modalPresentationStyle = .fullScreen
        
        navigationController.present(vc, animated: true, completion: nil)
    }
}

