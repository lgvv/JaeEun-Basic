//
//  PoliticianSection.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import Foundation
import RxDataSources

enum PoliticianSectionItem: Equatable, IdentifiableType {
    var identity: some Hashable { UUID().uuidString }
    
    case politicianCardCell(PoliticianCardCellViewModel)
    
    static func == (lhs: PoliticianSectionItem, rhs: PoliticianSectionItem) -> Bool {
        lhs.identity == rhs.identity
    }
}

enum PoliticianSection {
    case politicianCardCell([PoliticianSectionItem])
}

extension PoliticianSection: SectionModelType {
    typealias Item = PoliticianSectionItem
    
    var items: [PoliticianSectionItem] {
        switch self {
        case .politicianCardCell(let items): return items
        }
    }
    
    init(original: PoliticianSection, items: [PoliticianSectionItem]) {
        switch original {
        case .politicianCardCell: self = .politicianCardCell(items)
        }
    }
}
