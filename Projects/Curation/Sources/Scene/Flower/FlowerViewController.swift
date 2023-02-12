//
//  FlowerViewController.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/10.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import UIKit
import SnapKit

import ReusableKit
import BaseArchitecture
import Models

final class FlowerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    private enum Reusable {
        static let flowerCell = ReusableCell<FlowerCell>()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(Reusable.flowerCell)
        
        return cv
    }()
}

// MARK: - Layout

extension FlowerViewController {
    private func configureLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .fractionalWidth(1.0)))
            item.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalWidth(0.25)),
                                                           subitems: [item])
            group.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            return section
        }
    }
}

class FlowerViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
}
