//
//  FirebaseConfiguration.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/17.
//

import Foundation
import FirebaseCore

protocol FirebaseConfigurationProtocol {
    func configuration<T: AppDelegate>(_ delegate: T)
}

public class FirebaseConfiguration: FirebaseConfigurationProtocol {
    
    public init() { }
    
    func configuration<T: AppDelegate>(_ delegate: T) {
        FirebaseApp.configure()
    }
}
