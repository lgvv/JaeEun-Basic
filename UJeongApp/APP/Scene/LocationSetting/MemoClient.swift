//
//  MemoClient.swift
//  TCA_Simple_tutorial
//
//  Created by Jeff Jeong on 2022/08/04.
//

import Foundation
import ComposableArchitecture

// API 통신
struct MemoClient {
    
    /// 단일 아이템 조회
    var fetchMemoItem: (_ id: String) -> Effect<Memo, Failure>
    
    var fetchMemos: () -> Effect<Memos, Failure>
    
    struct Failure : Error, Equatable {}
}


extension MemoClient {
    static let live = Self(
        fetchMemoItem: { id in
            Effect.task{
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "https://603fca51d9528500176060fc.mockapi.io/api/01/todos/\(id)")!)
                return try JSONDecoder().decode(Memo.self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        }, fetchMemos: {
            Effect.task{
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "https://603fca51d9528500176060fc.mockapi.io/api/01/todos/")!)
                return try JSONDecoder().decode([Memo].self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        }
    )
}
