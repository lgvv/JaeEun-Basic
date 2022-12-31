//
//  NoticeViewController.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/30.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

final class NoticeViewController: UIViewController {
    private let disposeBag = DisposeBag()
    enum Reusable {
        static let notice = ReusableCell<NoticeCell>()
    }
    
    var viewModel: NoticeViewModel!
    private let dataSource = RxCollectionViewSectionedReloadDataSource<NoticeSection>(
        configureCell: { _, collectionView, indexPath, item in
            switch item {
            case .noticeCell(let viewModel):
                let cell = collectionView.dequeue(Reusable.notice, for: indexPath)
                
                return cell
            }
        })
        
    
    
    private func bind(viewModel: NoticeViewModel) {
        let viewWillAppear = self.rx.viewWillAppear
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let pull = collectionView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = NoticeViewModel.Input(searchTrigger: Driver.merge(viewWillAppear, pull),
                                          selection: collectionView.rx.itemSelected.asDriver())
        
        let output = viewModel.transform(input: input)
        
        disposeBag.insert {
            output.notices.drive(collectionView.rx.items(dataSource: self.dataSource))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(viewModel: viewModel)
    }
    
    // MARK: - UIComponents
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(Reusable.notice)
        
        return cv
    }()
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection in
            
            switch section {
            case 0: return UICollectionViewLayoutSet.shared.notice()
            default: return UICollectionViewLayoutSet.shared.notice()
            }
        }
    }
}

final class NoticeViewModel: ViewModelType {
    struct Input {
        let searchTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let notices: Driver<[NoticeSection]>
        let selectedNotice: Driver<Notice>
    }
    
    private let useCase: NoticeUseCase
    
    init(useCase: NoticeUseCaseImpl) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        
        return Output(notices: .empty(),
                      selectedNotice: .empty())
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
