//
//  Application.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit

final class Application {
    static let shard = Application()
    
    private let noticeUseCaseProvider: UseCaseProvider
    
    init() {
        self.noticeUseCaseProvider = NoticeUseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow?) {
        let noticeNavigationController = UINavigationController()
        noticeNavigationController.tabBarItem = UITabBarItem(title: "지역소식",
                                                             image: UIImage(systemName: "newspaper"),
                                                             selectedImage: UIImage(systemName: "newspaper"))
        let noticeNavigator = DefaultNoticeNavigator(navigationController: noticeNavigationController,
                                                     services: noticeUseCaseProvider)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            noticeNavigationController
        ]
        window?.rootViewController = tabBarController
        
        // TODO: - start navigator 연결
        noticeNavigator.toNotice()
    }
}
