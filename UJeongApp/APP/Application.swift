//
//  Application.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit

final class Application {
    static let shard = Application()
    
    private let noticeUseCaseProvider: NoticeUseCaseProvider
    private let peopleUseCaseProvider: PoliticianUseCaseProvider
    
    init() {
        self.noticeUseCaseProvider = NoticeUseCaseProvider()
        self.peopleUseCaseProvider = PoliticianUseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow?) {
        
        // MARK: - Notice
        
        let noticeNavigationController = UINavigationController()
        let noticeImage: UIImage = UIImage(systemName: "newspaper")!
        noticeNavigationController.tabBarItem = UITabBarItem(title: "지역소식",
                                                             image: noticeImage,
                                                             selectedImage: noticeImage)
        
        let noticeNavigator = DefaultNoticeNavigator(navigationController: noticeNavigationController,
                                                     services: noticeUseCaseProvider)
        
        // MARK: - Politican
        
        let politicanNavigationController = UINavigationController()
        let politicanImage: UIImage = .init(systemName: "person.3")!
        politicanNavigationController.tabBarItem = UITabBarItem(title: "의원",
                                                             image: politicanImage,
                                                             selectedImage: politicanImage)
        
        let politicanNavigator = DefaultPoliticianNavigator(navigationController: politicanNavigationController,
                                                         services: peopleUseCaseProvider)
        
        // MARK: - TabBar
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            noticeNavigationController,
            politicanNavigationController
        ]
        window?.rootViewController = tabBarController
        
        // TODO: - start navigator 연결
        noticeNavigator.toNotice()
        politicanNavigator.toPolitican()
    }
}
