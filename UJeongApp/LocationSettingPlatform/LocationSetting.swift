//
//  LocationSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.


import SwiftUI
import ComposableArchitecture

// MARK: - LocationSettingView

struct LocationSection: Identifiable {
    let id = UUID()
    
    let location: Location
    
    static func allSection() -> [LocationSection] {
        let seoul = LocationSection(location: .init(city: "서울특별시",
                                                    districts: Gu.allCases.map { $0.rawValue }.sorted(by: <)))
        
        return [seoul]
    }
}

struct LocationSettingView: View {
    typealias ViewModel = LocationSettingReducer
    
    let store: StoreOf<ViewModel>
    
    struct ViewState: Equatable {
        var selectedItem: String
        
        init(state: ViewModel.State) {
            self.selectedItem = state.selectedItem
        }
    }
    
    enum ViewAction {
        case itemSelected(location: String)
    }
    
    init(store: StoreOf<ViewModel>) {
        self.store = store
    }
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        WithViewStore(
            self.store,
            observe: ViewState.init,
            send: ViewModel.Action.init
        ) { viewStore in
            ForEach(LocationSection.allSection()) { section in
                List {
                    Section {
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: .none,
                            pinnedViews: []
                        ) {
                            ForEach(section.location.districts, id: \.self) { location in
                                Text(location)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 10)
                                    .border(Color.blue)
                                    .onTapGesture {
                                        print("hello \(location)")
                                        viewStore.send(.itemSelected(location: location))
                                    }
                                
                            }
                        }
                    } header: {
                        Text(section.location.city)
                    }
                }
                .listStyle(.sidebar)
            }
        }
    }
}

struct LocationSettingReducer: ReducerProtocol {
    struct State {
        var selectedItem = ""
    }
    
    enum Action {
        case itemSelected(location: String)
        
        init(action: LocationSettingView.ViewAction) {
            switch action {
            case let .itemSelected(location):
                self = .itemSelected(location: location)
            }
        }
    }
    
    // NOTE: - func reduce랑 동일
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .itemSelected(location):
                print("location은 \(location)입니다.")
                return .none
            }
        }
    }
    
    // NOTE: - Dependency
    private let sdkService = UJeongSDKService()
    
}

//struct TempSetting_Previews: PreviewProvider {
//    static let reducer: LocationSettingReducer = LocationSettingReducer()
//
//
//    static var previews: some View {
//        LocationSettingView(reducer: reducer)
//    }
//}
