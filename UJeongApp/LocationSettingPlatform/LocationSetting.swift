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
        var selectedLocation: String
        
        init(state: ViewModel.State) {
            self.selectedLocation = state.selectedLocation
        }
    }
    
    enum ViewAction {
        case itemSelected(location: String)
        case onAppear
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
                                    .padding(.vertical, 5)
                                    .overlay {
                                        if location == viewStore.state.selectedLocation {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 3)
                                        }
                                    }
                                    .onTapGesture {
                                        viewStore.send(.itemSelected(location: location))
                                    }
                            }
                        }
                    } header: {
                        Text(section.location.city)
                    }
                }
                .listStyle(.sidebar)
                .onAppear {
                    // 이게 두번 호출되는 이유는 store의 scope의 문제로 의심됩니다.
                    viewStore.send(.onAppear)
                    print("😊")
                }
            }
        }
    }
}

struct LocationSettingReducer: ReducerProtocol {
    struct State {
        var selectedLocation: String = ""
    }
    
    enum Action {
        case onAppear
        case itemSelected(location: String)
        case updateAppStorage
        
        init(action: LocationSettingView.ViewAction) {
            switch action {
            case .onAppear:
                self = .onAppear
            case let .itemSelected(location):
                self = .itemSelected(location: location)
            }
        }
    }
    
    // NOTE: - func reduce랑 동일
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.selectedLocation = sdkService.selectedLocation
                
                return .none
            case let .itemSelected(location):
                state.selectedLocation = location
                print("location은 \(location)입니다.")
                return EffectTask<Action>(value: .updateAppStorage)
            case .updateAppStorage:
                // db에 데이터 저장하기
                
                sdkService.selectedLocation = state.selectedLocation
                print("나도 불립니다! \(sdkService.selectedLocation)")
                return .none
            }
        }
    }
    
    // NOTE: - Dependency
    // live쪽을 살펴보기
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
