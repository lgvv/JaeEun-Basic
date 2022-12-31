//
//  BaseCollectionViewCell.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() { /* override point */ }
    
    func initialize(viewModel: AnyObject) { }
}
