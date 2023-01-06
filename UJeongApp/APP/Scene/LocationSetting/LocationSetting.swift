//  https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/reducerprotocol/
//  LocationSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.


import SwiftUI
import ComposableArchitecture

struct LocationSettingViewModel: ReducerProtocol {
    struct State: Equatable {
        var selectedItem = ""
    }

    enum Action: Equatable {
        case didTapItem(_ item: String)
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.EffectTask<Action> {
        switch action {
        case .didTapItem(let item):
            state.selectedItem = item
            return EffectTask.none
        }
    }
    
    
    
    struct Environment {
        var appStorageManager = AppStorageManager()
    }
    
//    struct Environment {
//        var appStorageManager = AppStorageManager()
//    }
//
//    let reducer = Reducer<State, Action, Environment> { state, action, env in
//
//        switch action {
//        case .selection(let name):
//            state.selectedLocation = name
//
//            return Effect.none
//        }
//    }
}


struct LocationSettingView: View {
    typealias ViewModel = LocationSettingViewModel
    let store: Store<ViewModel.State, ViewModel.Action>
    
    var body: some View {
        List {
            Section {
                LocationGridView()
            } header: {
                Text("서울특별시")
            }
        }
        .navigationTitle("List Style")
        .listStyle(.sidebar)
    }
}

struct LocationGridView: View {
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]

    private let locationGus = Gu.allCases.map { $0.rawValue }.sorted(by: <)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                
                ForEach(locationGus, id: \.self) { value in
                    Text("\(value)")
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .border(Color.blue)
                }
            }
        }
    }
}

//struct TempSetting_Previews: PreviewProvider {
////    typealias ViewModel = LocationSettingViewModel
//    static let store: Store<LocationSettingViewModel.State, LocationSettingViewModel.Action>
//
//    static var previews: some View {
//        LocationSettingView(store: store)
//    }
//}
