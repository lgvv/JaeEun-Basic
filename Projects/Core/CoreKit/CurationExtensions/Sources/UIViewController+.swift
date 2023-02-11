//
//  UIViewController+.swift
//  CoreKit
//
//  Created by Hamlit Jason on 2023/02/11.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// 화면을 터치했을 때 키보드를 숨깁니다.
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
