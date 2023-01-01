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
                cell.bind(viewModel)
                
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
        
        configureUI()
        bind(viewModel: viewModel)
    }
    
    // MARK: - UIComponents
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(Reusable.notice)
        cv.refreshControl = UIRefreshControl()
        
        return cv
    }()
}

extension NoticeViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection in
            
            switch section {
            case 0: return UICollectionViewLayoutSet.shared.notice()
            default: return UICollectionViewLayoutSet.shared.notice()
            }
        }
    }
    
    func configureUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
