//  https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/reducerprotocol/
//  LocationSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.


import SwiftUI
import ComposableArchitecture

// MARK: - LocationSettingCore

struct LocationSettingState {
    var selectedItem = ""
}

enum LocationSettingAction: Equatable {
    case didTapItem(_ item: String)
}

struct LocationSettingEnvironment {
    var userDefaultService: AppStorageServiceProtocol = AppStorageService()
}



// MARK: - LocationSettingView

struct LocationSettingView: View {
//    let store: Store<LocationSettingState, LocationSettingAction>
    let reducer: LocationSettingReducer
    
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

struct LocationSettingReducer: ReducerProtocol {
    struct State {
        var selectedItem = ""
    }

    enum Action {
        case itemSelected
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .itemSelected:
            state.selectedItem
            return Effect.none
        }
    }

    private let sdkService = UJeongSDKService()
}

//struct TempSetting_Previews: PreviewProvider {
////    typealias ViewModel = LocationSettingViewModel
//    static let store: Store<LocationSettingViewModel.State, LocationSettingViewModel.Action>
//
//    static var previews: some View {
//        LocationSettingView(store: store)
//    }
//}
