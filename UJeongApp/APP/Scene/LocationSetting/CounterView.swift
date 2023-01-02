////
////  CounterView.swift
////  UJeongApp
////
////  Created by Hamlit Jason on 2023/01/02.
////
//
//// https://mockapi.io/projects/63b29da35e490925c51cd5cd
//import SwiftUI
//import Combine
//import ComposableArchitecture
//
//struct Memo: Codable, Equatable, Identifiable {
//    let createAt, title, viewCount, id: String
//}
//
//typealias Memos = [Memo]
//
//struct MemoClinet {
//    
//    /// 단일 아이템 조회
//    var fetchMemoItem: (_ id: String) -> Effect<Memo, Failure>
//    
//    /// 모든 아이템 조회
//    var fetchMemos: () -> Effect<[Memo], Failure>
//    
//    struct Failure: Error, Equatable { }
//}
//
//extension MemoClinet {
//    static let live = Self(
//        fetchMemoItem: { id in
//            Effect.task {
//                let (data, _) = try await URLSession.shared
//                    .data(from: URL(string: "https://63b29da35e490925c51cd5cc.mockapi.io/api/01/todos/\(id)")!)
//                
//                return try JSONDecoder().decode(Memo.self, from: data)
//            }
//            .mapError { _ in Failure() }
//            .eraseToEffect()
//        }, fetchMemos: {
//            Effect.task {
//                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://63b29da35e490925c51cd5cc.mockapi.io/api/01/todos/")!)
//                return try JSONDecoder().decode([Memo].self, from: data)
//            }
//            .mapError { _ in Failure() }
//            .eraseToEffect()
//        }
//    )
//}
//
//
//
//struct MemoState: Equatable {
//    var memos: [Memo] = []
//    var selectedMemo: Memo? = nil
//    var isLoading: Bool = false
//}
//
//enum MemoAction: Equatable {
//    case fetchItem(_ id: String)
//    case fetchItemReponse(Result<Memo, MemoClinet.Failure>)
//    case fetchAll // 모두 조회 액션
//    case fetchAllReponse(Result<[Memo], MemoClinet.Failure>)
//}
//
//struct MemoEnvironment {
//    var memoClient: MemoClinet
//    var mainQueue: AnySchedulerOf<DispatchQueue>
//}
//
//let memoReducer = Reducer<MemoState, MemoAction, MemoEnvironment> { state, action, environment in
//    switch action {
//    case .fetchItem(let id):
//        enum FetchItemId { }
//        state.isLoading = true
//        
//        return environment.memoClient
//            .fetchMemoItem(id)
//            .debounce(id: FetchItemId.self, for: 0.3, scheduler: environment.mainQueue)
//            .catchToEffect(MemoAction.fetchItemReponse)
//    case .fetchItemReponse(.success(let memo)):
//        state.selectedMemo = memo
//        state.isLoading = false
//        return Effect.none
//    case .fetchItemReponse(.failure):
//        state.selectedMemo = nil
//        state.isLoading = false
//        return Effect.none
//        
//    case .fetchAll:
//        enum FetchAllId { }
//        state.isLoading = true
//        
//        return environment.memoClient
//            .fetchMemos
//            .debounce(id: FetchAllId.self, for: 0.3, scheduler: environment.mainQueue)
//            .catchToEffect(MemoAction.fetchAllReponse)
//    case .fetchAllReponse(.success(let memo)):
//        state.memos = memo
//        state.isLoading = false
//        return Effect.none
//    case .fetchAllReponse(.failure):
//        state.memos = nil
//        state.isLoading = false
//        return Effect.none
//    }
//}
//
//struct MemoView: View {
//    let store: Store<MemoState, MemoAction>
//    
//    var body: some View {
//        WithViewStore(self.store) { viewStore in
//            
//            ZStack {
//                
//                if viewStore.state.isLoading {
//                    Color.black.opacity(0.3)
//                        .overlay {
//                            ProgressView().tint(.white)
//                                .scaleEffect(1.7)
//                        }
//                        .zIndex(1)
//                }
//            }
//            
//            List {
//                Section(header:
//                            VStack(spacing: 8) {
//                    Button("메모 목록 가져오기", action: {
//                        viewStore.send(.fetchAll)
//                    })
//                    Text("선택한 메모 정보")
//                    Text(viewStore.state.selectedMemo?.id ?? "비어있음")
//                    Text(viewStore.state.selectedMemo?.title ?? "비어있음")
//                }, content: {
//                    
//                    ForEach(viewStore.state.memos) { aMemo in
//                        Button(aMemo.title, action: {
//                            viewStore.send(.fetchItem(aMemo.id))
//                        })
//                    }
//                })
//            }
//        }
//    }
//}
//
////struct TempSetting_Previews: PreviewProvider {
////    let memoStore = Store<MemoState, Any>(initialState: MemoState(),
////                      reducer: memoReducer,
////                      environment: MemoEnvironment(memoClient: MemoClinet.live,
////                                                   mainQueue: .main))
////
////    static var previews: some View {
////        MemoView(store: memoStore)
////    }
////}
