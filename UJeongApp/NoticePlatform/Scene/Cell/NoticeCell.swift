//
//  NoticeCell.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import UIKit

final class NoticeCell: BaseCollectionViewCell {

    func bind(_ viewModel: NoticeCellViewModel) {
        self.noticeTitle.text = viewModel.title
        self.noticeDate.text = viewModel.date
    }
    
    // MARK: - Initialize
    override func initialize() {
        self.configureUI()
    }
    
    // MARK: - UIComponents
    let noticeTitle = UILabel()
    let noticeDate = UILabel()
}

extension NoticeCell {
    private func configureUI() {
        contentView.addSubview(noticeTitle)
        noticeTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(noticeDate)
        noticeDate.snp.makeConstraints {
            $0.top.equalTo(noticeDate.snp.bottom).inset(10)
            $0.leading.equalTo(noticeDate.snp.leading)
        }
    }
}
