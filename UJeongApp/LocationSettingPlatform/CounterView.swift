//
//  ContentView.swift
//  TCA_Simple_tutorial
//
//  Created by Jeff Jeong on 2022/08/04.
//

import SwiftUI
import ComposableArchitecture

// 도메인 + 상태
struct CounterState: Equatable {
    var count = 0
}

// 도메인 + 액션
enum CounterAction: Equatable {
    case addCount // 카운트를 더하는 액션
    case subtractCount // 카운트를 빼는 액션
}

struct CounterEnvironment {}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    // 들어온 액션에 따라 상태를 변경
    switch action {
    case .addCount:
        state.count += 1
        return Effect.none
    case .subtractCount:
        state.count -= 1
        return Effect.none
    }
}

struct CounterView: View {
    
    let store : Store<CounterState, CounterAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("count: \(viewStore.state.count)")
                    .padding()
                HStack{
                    Button("더하기", action: { viewStore.send(.addCount) })
                    Button("뺴기", action: { viewStore.send(.subtractCount) })
                }
            }
        }
    }
}

//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView()
//    }
//}
