//
//  NoticeViewModel.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import UIKit
import RxSwift
import RxCocoa

final class NoticeViewModel: ViewModelType {
    struct Input {
        let didTapLocation: Driver<Void>
        let fetchTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let notices: Driver<[NoticeSection]>
        let selectedNotice: Driver<Notice>
        let showsLocationView: Driver<Void>
    }
    
    private let useCase: NoticeUseCase
    private let navigator: NoticeNavigator
    
    init(useCase: NoticeUseCase, navigator: NoticeNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
//        let selectedPost = input.selection
        
        let showsLocationView = input.didTapLocation
            .do(onNext: navigator.toLocationSetting)
        
        return Output(notices: .empty(),
                      selectedNotice: .empty(),
                      showsLocationView: showsLocationView
        )
    }
}


//final class NoticeViewModel: ViewModelType {
//    typealias Input = <#type#>
//
//    typealias Output = <#type#>
//
//    let input = PublishSubject<String>()
//
//    let output: Driver<SearchInfomation>
//
//    init(apiClient: APIClient = APIClient()) {
//        self.output = apiClient.searchWithRx()
//            .asDriver(onErrorJustReturn: .init(totalCount: nil, incompleteResults: nil, items: []))
//
//    }
//}
//
//extension NoticeViewController {
//
//}
