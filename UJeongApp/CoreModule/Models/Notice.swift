//
//  Notice.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import Foundation

public struct Notice {
    public let title: String // 공지제목
    public let date: String // 공지날짜
    
    public init(title: String, date: String) {
        self.title = title
        self.date = date
    }
}
