//
//  LocationSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.


import SwiftUI
import ComposableArchitecture

enum Gu: String, CaseIterable {
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


struct LocationSettingView: View {

    var body: some View {
        List {
            Section {
                VerticalSmileys()
            } header: {
                Text("서울특별시")
            }
        }
        .navigationTitle("List Style")
        .listStyle(.sidebar)
    }
}

struct VerticalSmileys: View {
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]

    private let locationGus = Gu.allCases.map { $0.rawValue }.sorted(by: <)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                
                ForEach(locationGus, id: \.self) { value in
                    Text("\(value)")
                }
            }
        }
    }
}

struct TempSetting_Previews: PreviewProvider {
    static var previews: some View {
        LocationSettingView()
    }
}
