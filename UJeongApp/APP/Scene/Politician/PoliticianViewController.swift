//
//  PoliticianViewController.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import UIKit
import RxSwift
import RxCocoa

class PoliticianViewController: UIViewController {
    
    var viewModel: PoliticianViewModel!
    
    private func bind(viewModel: PoliticianViewModel) {
        
    }
    
    init(viewModel: PoliticianViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
        
        self.configureUI()
        self.configureNavigationItem()
        
        self.bind(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PoliticianViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection in
            
            switch section {
            case 0: return UICollectionViewLayoutSet.shared.notice()
            default: return UICollectionViewLayoutSet.shared.notice()
            }
        }
    }
    
    func configureUI() {
        
    }
    
    func configureNavigationItem() {
        
    }
}
