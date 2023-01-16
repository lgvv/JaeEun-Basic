//
//  LocationSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/03.


import SwiftUI
import ComposableArchitecture

// MARK: - LocationSettingView

struct LocationSettingView: View {
    typealias Core = LocationSettingCore
    
    let store: StoreOf<Core>
    
    struct ViewState: Equatable {
        var selectedLocation: String
        
        init(state: Core.State) {
            self.selectedLocation = state.selectedLocation
        }
    }
    
    enum ViewAction {
        case itemSelected(location: String)
        case onAppear
    }
    
    init(store: StoreOf<Core>) {
        self.store = store
    }
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        WithViewStore(self.store.scope(state: \.selectedLocation)) {
            viewStore in
            ForEach(LocationSection.allSection()) { section in
                List {
                    Section {
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: .none
                        ) {
                            ForEach(section.location.districts, id: \.self) { location in
                                
                                Text(location)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 5)
                                    .overlay {
                                        if location == viewStore.state {
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
            }
            .onAppear {
                viewStore.send(.onAppear)
                print("😊")
            }
        }
    }
}
