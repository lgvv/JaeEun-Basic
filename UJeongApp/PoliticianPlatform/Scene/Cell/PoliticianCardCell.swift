//
//  PoliticianCardCell.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import UIKit
import Combine
import Nuke

final class PoliticianCardCell: BaseCollectionViewCell {
    typealias ViewModel = PoliticianCardCellViewModel
    
    private var cancelBag = Set<AnyCancellable>()
    // MARK: - Binding
    
    func bind(viewModel: ViewModel) {
        viewModel.$infomation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] information in
                guard let self else { return }
                
                let assetName = "서울시-" + information.gu + ".jpeg"
                self.thumbnailImageView.image = UIImage(assetName: assetName)
                
                self.nameLabel.text = information.name
                self.guLabel.text = information.gu
                self.partyLabel.text = information.party.rawValue
                
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
    
    private lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .top
        return $0
    }(UIStackView())
    
    private lazy var nameLabel = UILabel() // 이름
    private lazy var guLabel = UILabel() // 구
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
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(guLabel)
        stackView.addArrangedSubview(partyLabel)
        stackView.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        
    }
}
