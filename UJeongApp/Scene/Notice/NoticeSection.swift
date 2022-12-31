//
//  NoticeSectionItem.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import Foundation
import RxDataSources

enum NoticeSectionItem: Equatable, IdentifiableType {
    var identity: some Hashable { UUID().uuidString }
    
    case noticeCell(NoticeCellViewModel)
    
    static func == (lhs: NoticeSectionItem, rhs: NoticeSectionItem) -> Bool {
        lhs.identity == rhs.identity
    }
}

enum NoticeSection {
    case noticeCell([NoticeSectionItem])
}

extension NoticeSection {
    typealias Item = NoticeSectionItem
    
    var items: [NoticeSectionItem] {
        switch self {
        case .noticeCell(let items): return items
        }
    }
    
    init(original: NoticeSection, items: [NoticeSectionItem]) {
        switch original {
        case .noticeCell: self = .noticeCell(items)
        }
    }
}
