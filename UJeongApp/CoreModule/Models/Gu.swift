//
//  Location.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/04.
//

import Foundation

/*
 대도시는 구로 분류할 수 있다면 구단위로 분류합니다.
 
 만약 지방 소도시의 경우에는 구단위로 분류하기가 어렵다면 시단위로 분류할 수 있습니다.
 차후 확장성을 늘 생각합시다.
 
 */

public enum Gu: String, CaseIterable {
    case 강서구
    case 양천구
    case 구로구
    case 금천구
    case 관악구
    
    case 영등포구
    case 동작구
    case 서초구
    case 강남구
    case 송파구
    
    case 강동구
    case 용산구
    case 성동구
    case 광진구
    case 동대문구
    
    case 중랑구
    case 노원구
    case 도봉구
    case 강북구
    case 성북구
    
    case 종로구
    case 서대문구
    case 중구
    case 마포구
    case 은평구
}
