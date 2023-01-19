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
        self.nameLabel.text = viewModel.infomation.name
//        self.partyLabel.text = viewModel.infomation.party
        self.descriptionLabel.text = ""
    }
    
    override func initialize() {
        
    }
    
    // MARK: - UIComponents
    
    private lazy var thumbnailImageView: UIImageView = {
        $0.backgroundColor = .blue.withAlphaComponent(0.2)
        return $0
    }(UIImageView()) // 이미지
    
    private lazy var nameLabel = UILabel() // 이름
    
    private lazy var partyLabel = UILabel() // 당
    
    private lazy var descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15)
        return $0
    }(UILabel()) // 강점 3줄
}

extension PoliticianCardCell {
    func configureUI() {
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1.2)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(thumbnailImageView)
        }
    }
}
