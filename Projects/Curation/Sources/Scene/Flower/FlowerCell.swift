//
//  FlowerCell.swift
//  Curation
//
//  Created by Hamlit Jason on 2023/02/12.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import UIKit

import Models
import BaseArchitecture
import Nuke

final class FlowerCell: BaseCollectionViewCell {
    
    // MARK: - Bind
    func configureCell(_ model: Flower) {
        thumbnailImageView.image = UIImage(systemName: "plus")
        nameLabel.text = model.name
        floriographyLabel.text = model.floriography
        storyLabel.text = model.story
    }
    
    override func initialize() {
        self.configureUI()
    }
    
    // MARK: - UIComponents
    
    private lazy var thumbnailImageView: UIImageView = {
        
        return $0
    }(UIImageView())
    
    private lazy var nameLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    private lazy var floriographyLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    private lazy var storyLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    private func configureUI() {
        addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(80)
            $0.centerY.equalToSuperview()
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.top)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        
        addSubview(floriographyLabel)
        floriographyLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.top)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
        addSubview(storyLabel)
        storyLabel.snp.makeConstraints {
            $0.top.equalTo(floriographyLabel.snp.top)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
    }
}
