//
//  Memo.swift
//  TCA_Simple_tutorial
//
//  Created by Jeff Jeong on 2022/08/04.
//

import Foundation

// MARK: - MemoElement
struct Memo: Codable, Equatable, Identifiable {
    let createdAt, title, viewCount, id: String
}

typealias Memos = [Memo]
