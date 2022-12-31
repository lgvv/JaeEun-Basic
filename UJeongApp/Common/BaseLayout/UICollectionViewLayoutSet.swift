//
//  UICollectionViewLayoutSet.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import UIKit

protocol UICollectionViewLayoutSetProtocol {
    func notice() -> NSCollectionLayoutSection
}

final class UICollectionViewLayoutSet: UICollectionViewLayoutSetProtocol {
    typealias LayoutItem = NSCollectionLayoutItem
    typealias LayoutGroup = NSCollectionLayoutGroup
    typealias LayoutSection = NSCollectionLayoutSection
    
    static let shared = UICollectionViewLayoutSet()
    
    func notice() -> NSCollectionLayoutSection {
        let item = LayoutItem(layoutSize: .init(.fractionalWidth(1.0),
                                                .fractionalHeight(1.0)))
        
        let group = LayoutGroup.horizontal(layoutSize: .init(.fractionalHeight(1.0),
                                                             .fractionalHeight(1.0)),
                                           subitems: [item])
       
        let secion = LayoutSection(group: group)
        return secion
    }
}

extension NSCollectionLayoutItem {
    convenience init(_ layoutSize: NSCollectionLayoutSize) {
        self.init(layoutSize: layoutSize)
    }
}

extension NSCollectionLayoutSize {
    convenience init(
        _ widthDimension: NSCollectionLayoutDimension,
        _ heightDimension: NSCollectionLayoutDimension
    ) {
        self.init(widthDimension: widthDimension, heightDimension: heightDimension)
    }
}
