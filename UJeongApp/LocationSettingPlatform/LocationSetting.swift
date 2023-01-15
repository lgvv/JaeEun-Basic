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
        case itemSelected
    }
    
    init(store: StoreOf<ViewModel>) {
        self.store = store
    }
    
    @State private var multiSelection = Set<UUID>() {
        didSet { print("\(multiSelection)") }
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
            
//            ScrollView {
//                LazyVGrid(columns: columns,
//                          alignment: .center,
//                          spacing: .none,
//                          pinnedViews: []) {
//                    ForEach(viewStore.allLocation, id: \.self) { i in
//                        Text("i")
//                    }
//                }
//            }
            
            List(selection: $multiSelection) {
                Section {
                    LocationGridView()
                } header: {
                    Text("서울특별시")
                }
            }
            .navigationTitle("List Style")
            .listStyle(.sidebar)
            
            Text("\(multiSelection.count) selections")
        }
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
        
        init(action: LocationSettingView.ViewAction) {
            switch action {
            case .itemSelected: self = .itemSelected
            }
        }
    }
    
    // NOTE: - func reduce랑 동일
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .itemSelected:
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
