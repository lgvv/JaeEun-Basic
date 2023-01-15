//
//  MemoView.swift
//  TCA_Simple_tutorial
//
//  Created by Jeff Jeong on 2022/08/04.
//

import Foundation
import SwiftUI
import ComposableArchitecture

// MARK: - MemoElement
struct Memo: Codable, Equatable, Identifiable {
    let createdAt, title, viewCount, id: String
}

typealias Memos = [Memo]


// API 통신
struct MemoClient {
    
    /// 단일 아이템 조회
    var fetchMemoItem: (_ id: String) -> Effect<Memo, Failure>
    
    var fetchMemos: () -> Effect<Memos, Failure>
    
    struct Failure : Error, Equatable {}
}


extension MemoClient {
    static let live = Self(
        fetchMemoItem: { id in
            Effect.task{
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "https://603fca51d9528500176060fc.mockapi.io/api/01/todos/\(id)")!)
                return try JSONDecoder().decode(Memo.self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        }, fetchMemos: {
            Effect.task{
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "https://603fca51d9528500176060fc.mockapi.io/api/01/todos/")!)
                return try JSONDecoder().decode([Memo].self, from: data)
            }
            .mapError { _ in Failure() }
            .eraseToEffect()
        }
    )
}



// 도메인 + 상태
struct MemoState: Equatable {
    var memos : [Memo] = []
    var selectedMemo : Memo? = nil
    var isLoading : Bool = false
}

// 도메인 + 액션
enum MemoAction: Equatable {
    case fetchItem(_ id: String) // 단일 조회 액션
    case fetchItemResponse(Result<Memo, MemoClient.Failure>) // 단일 조회 액션 응답
    case fetchAll // 모두 조회 액션
    case fetchAllResponse(Result<[Memo], MemoClient.Failure>) // 모두 조회 액션 응답
}

// 환경설정 주입
struct MemoEnvironment {
    var memoClient : MemoClient
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

// 상태와 액션을 가지고 있는 리듀서
// 액션이 들어왔을때 상태를 변경하는 부분
let memoReducer = Reducer<MemoState, MemoAction, MemoEnvironment> { state, action, environment in
    // 들어온 액션에 따라 상태를 변경
    switch action {
    case .fetchItem(let memoId):
        enum FetchItemId {}
        state.isLoading = true
        return environment.memoClient
            .fetchMemoItem(memoId)
            .debounce(id: FetchItemId.self,
                      for: 0.3,
                      scheduler: environment.mainQueue)
            .catchToEffect(MemoAction.fetchItemResponse)
    case .fetchItemResponse(.success(let memo)):
        state.selectedMemo = memo
        state.isLoading = false
        return Effect.none
    case .fetchItemResponse(.failure):
        state.selectedMemo = nil
        state.isLoading = false
        return Effect.none
    case .fetchAll:
        enum FetchAllId {}
        state.isLoading = true
        return environment.memoClient
            .fetchMemos()
            .debounce(id: FetchAllId.self,
                      for: 0.3,
                      scheduler: environment.mainQueue)
            .catchToEffect(MemoAction.fetchAllResponse)
    case .fetchAllResponse(.success(let memos)):
        state.memos = memos
        state.isLoading = false
        return Effect.none
    case .fetchAllResponse(.failure):
        state.memos = []
        state.isLoading = false
        return Effect.none
    }
}

struct MemoView: View {
    
    let store : Store<MemoState, MemoAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            
            ZStack {
                
                if viewStore.state.isLoading {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .overlay{
                            ProgressView().tint(.white)
                                .scaleEffect(1.7)
                        }.zIndex(1)
                }
                
                List{
                    Section(header:
                        VStack(spacing: 8) {
                            Button("메모 목록 가져오기", action: {
                                viewStore.send(.fetchAll, animation: .default)
                            })
                            Text("선택된 메모정보")
                            Text(viewStore.state.selectedMemo?.id ?? "비어있음")
                            Text(viewStore.state.selectedMemo?.title ?? "비어있음")
                        }
                    ,
                        content: {
                        ForEach(viewStore.state.memos) { aMemo in
                            Button(aMemo.title, action: {
                                viewStore.send(.fetchItem(aMemo.id), animation: .default)
                            })
                        }
                    })
                }.listStyle(PlainListStyle())
            }
        }
    }
}

//struct CounterView_Previews: PreviewProvider {
//    static let memoStore = Store(initialState: MemoState(),
//                          reducer: memoReducer,
//                          environment: MemoEnvironment(
//                            memoClient: MemoClient.live,
//                            mainQueue: .main
//                          ))
//
//    static var previews: some View {
//        MemoView(store: memoStore)
//    }
//}
