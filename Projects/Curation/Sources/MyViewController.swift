//
//  MyViewController.swift
//  TuistApp
//
//  Created by Hamlit Jason on 2023/02/10.
//  Copyright © 2023 com.app.my.lgvv. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftUI

class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

@main
struct SwiftUIDemoApp: App {
    
    var body: some Scene {
        WindowGroup {
            MyView()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

import SwiftUI
struct MyView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MyViewController
    
    func makeUIViewController(context: Context) -> MyViewController {
        // Return MyViewController instance
        let vc = MyViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MyViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
