//
//  PoliticianCardCell.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import UIKit

final class PoliticianCardCell: BaseCollectionViewCell {
    
    // MARK: - Binding
    
    func bind(_ viewModel: PoliticianCardCellViewModel) {
        self.thumbnailImageView.image = UIImage()
//        self.nameLabel.text = viewModel.politician.name
//        self.partyLabel.text = viewModel.politician.party
        self.descriptionLabel.text = ""
    }
    
    override func initialize() {
//        contentView.addSubview(rootFlexContainer)
        
//        rootFlexContainer.flex.define { flex in
//            flex.addItem()
//                .alignItems(.center)
//                .define { flex in
//                    flex.addItem(thumbnailImageView)
//                        .aspectRatio(1)
//                }
//
//            flex.addItem()
//                .direction(.row)
//                .define { flex in
//                    flex.addItem(nameLabel)
//                    flex.addItem(partyLabel)
//                }
//                .marginLeft(10%)
//
//            flex.addItem()
//                .define { flex in
//                    flex.addItem(nameLabel).grow(1)
//                    flex.addItem(descriptionLabel).grow(4)
//                }
//                .grow(1)
//        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.rootFlexContainer.pin.all(contentView.safeAreaInsets)
//        self.rootFlexContainer.flex.layout()
    }
    
    // MARK: - UIComponents
    
    let rootFlexContainer: UIView = UIView()
    
    let thumbnailImageView: UIImageView = {
        $0.backgroundColor = .blue.withAlphaComponent(0.2)
        return $0
    }(UIImageView()) // 이미지
    
    let nameLabel = UILabel() // 이름
    let partyLabel = UILabel() // 당
    
    let descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15)
        return $0
    }(UILabel()) // 강점 3줄
}

