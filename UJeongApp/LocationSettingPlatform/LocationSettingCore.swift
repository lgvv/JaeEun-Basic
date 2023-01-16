//
//  LocationSettingCore.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/16.
//

import Foundation
import ComposableArchitecture

struct LocationSettingCore: ReducerProtocol {
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
                jjs.selectedLocation = state.selectedLocation
                
                sdkService.selectedLocation = state.selectedLocation
                print("나도 불립니다! \(sdkService.selectedLocation)")
                return .none
            }
        }
    }
    
    // NOTE: - Dependency
    // live쪽을 살펴보기
    private let sdkService = UJeongSDKService()
    @Dependency(\.sdkService) var jjs
    
}

extension UJeongSDKServiceInTCA: DependencyKey {
    public static let liveValue: UJeongSDKServiceInTCA = Self(
        selectedLocation: ""
    )
}

extension DependencyValues {
    var sdkService: UJeongSDKServiceInTCA {
        get { self[UJeongSDKServiceInTCA.self] }
        set { self[UJeongSDKServiceInTCA.self] = newValue }
    }
}
