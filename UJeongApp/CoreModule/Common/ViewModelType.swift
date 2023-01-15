//
//  ViewModelType.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
