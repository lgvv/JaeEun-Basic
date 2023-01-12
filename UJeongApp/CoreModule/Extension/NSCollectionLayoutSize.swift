//
//  NSCollectionLayoutSize.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import UIKit

extension NSCollectionLayoutSize {
    convenience init(
        _ widthDimension: NSCollectionLayoutDimension,
        _ heightDimension: NSCollectionLayoutDimension
    ) {
        self.init(widthDimension: widthDimension, heightDimension: heightDimension)
    }
}
