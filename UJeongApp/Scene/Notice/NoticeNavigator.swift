//
//  NoticeNavigator.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit

protocol NoticeNavigator {
    
}

class DefaultNoticeNavigator: NoticeNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toNoticeDetail() {
        
    }
}
