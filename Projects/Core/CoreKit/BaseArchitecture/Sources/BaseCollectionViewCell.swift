//
//  BaseCollectionViewCell.swift
//  CoreKit
//
//  Created by Hamlit Jason on 2023/02/12.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import UIKit

public class BaseCollectionViewCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func initialize() { /* override point */ }
}
