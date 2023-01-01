//
//  NoticeCellViewModel.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import Foundation

final class NoticeCellViewModel {
    let title: String
    let date: String
    
    init(with notice: Notice) {
        self.title = notice.title
        self.date = notice.date
    }
}
