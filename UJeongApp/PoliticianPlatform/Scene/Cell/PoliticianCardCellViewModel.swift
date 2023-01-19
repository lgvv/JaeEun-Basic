//
//  PoliticianCardCellViewModel.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.
//

import Foundation
import Combine

final class PoliticianCardCellViewModel {
    @Published var infomation: Politician.Mayor.Infomation
    
    init(with infomation: Politician.Mayor.Infomation) {
        self.infomation = infomation
    }
}
