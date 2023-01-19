//
//  PoliticianCardCell.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import UIKit
import Combine

final class PoliticianCardCell: BaseCollectionViewCell {
    typealias ViewModel = PoliticianCardCellViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    // MARK: - Binding
    
    func bind(viewModel: ViewModel) {
        viewModel.$infomation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] information in
                guard let self else { return }
                
                self.nameLabel.text = information.name
            }.store(in: &cancelBag)
    }
    
    override func initialize() {
        self.configureUI()
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
//        contentView.addSubview(thumbnailImageView)
//        thumbnailImageView.snp.makeConstraints {
//            $0.top.leading.trailing.equalToSuperview().inset(10)
//            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1.2)
//        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
