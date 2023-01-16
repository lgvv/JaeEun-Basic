//
//  LocationSection.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/16.
//

import Foundation

struct LocationSection: Identifiable, Equatable {
    let id = UUID()
    
    let location: Location
    
    static func allSection() -> [LocationSection] {
        let seoul = LocationSection(location: .init(city: "서울특별시",
                                                    districts: Gu.allCases.map { $0.rawValue }.sorted(by: <)))
        
        return [seoul]
    }
}
