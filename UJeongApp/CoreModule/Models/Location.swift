//
//  Location.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/16.
//

import Foundation

/*
 대도시는 구로 분류할 수 있다면 구단위로 분류합니다.
 
 만약 지방 소도시의 경우에는 구단위로 분류하기가 어렵다면 시단위로 분류할 수 있습니다.
 차후 확장성을 늘 생각합시다.
 
 */

public struct Location: Hashable {
    public var city: String // 도시이름
    public var districts: [String] // 지역구
}
