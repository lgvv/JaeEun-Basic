//
//  FlowerView.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/11.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import SwiftUI

struct FlowerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = FlowerViewController
    
    func makeUIViewController(context: Context) -> FlowerViewController {
        let viewController = FlowerViewController()
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: FlowerViewController, context: Context) {}
}
