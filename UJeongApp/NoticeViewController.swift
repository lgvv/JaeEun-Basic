//
//  NoticeViewController.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class NoticeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

final class NoticeViewModel: ViewModelType {
    func transform(input: Input) -> Output {
        
        return Output(notices: <#T##Driver<SearchInfomation>#>)
    }
}

extension NoticeViewModel {
    struct Input {
        let searchTrigger: Driver<Void>
    }
    
    struct Output {
        let notices: Driver<SearchInfomation>
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
