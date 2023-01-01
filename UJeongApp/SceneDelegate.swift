//
//  SceneDelegate.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        Application.shard.configureMainInterface(in: window!)
        window?.makeKeyAndVisible()
    }
}

final class Application {
    static let shard = Application()
    
    private let noticeUseCaseProvider: UseCaseProvider
    
    init() {
        self.noticeUseCaseProvider = NoticeUseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow) {
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
        window.rootViewController = tabBarController
        
        // TODO: - start navigator 연결
        noticeNavigator.toNotice()
    }
}

public final class NoticeUseCaseProvider: UseCaseProvider {
    private let noticeRepository: NoticeRepository
    
    init() {
        noticeRepository = NoticeRepositoryImpl()
    }
    
    func makeNoticeUseCase() -> NoticeUseCase {
        return NoticeUseCaseImpl(noticeRepository: noticeRepository)
    }
}
