//
//  LocationSettingCore.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/16.
//

import Foundation
import ComposableArchitecture

struct LocationSettingCore: ReducerProtocol {
    struct State: Equatable {
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
                
                return EffectTask<Action>(value: .updateAppStorage)
            case .updateAppStorage:
                sdkService.selectedLocation = state.selectedLocation
                
                return .none
            }
        }
    }
    
    private let sdkService = UJeongSDKService()
}
