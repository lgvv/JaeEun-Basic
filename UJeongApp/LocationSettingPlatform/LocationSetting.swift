//
//  LocationSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.


import SwiftUI
import ComposableArchitecture

// MARK: - LocationSettingView

struct LocationSettingView: View {
    typealias ViewModel = LocationSettingReducer
    
    let store: StoreOf<ViewModel>
    
    struct ViewState: Equatable {
        var selectedItem: String
        var allLocation: [String: [String]]
        
        init(state: ViewModel.State) {
            self.allLocation = state.allLocation
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
    var body: some View {
        WithViewStore(
            self.store,
            observe: ViewState.init,
            send: ViewModel.Action.init
        ) { viewStore in
            
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
                    Button("\(value)", action: {
//                        viewStore.send(.fetchItem(aMemo.id), animation: .default)
                    })
//
//                    Text("\(value)")
//                        .padding(.horizontal, 5)
//                        .padding(.vertical, 10)
//                        .border(Color.blue)
                }
            }
        }
    }
}

struct LocationSettingReducer: ReducerProtocol {
    struct State {
        let allLocation = Location.allLocation()
        
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
