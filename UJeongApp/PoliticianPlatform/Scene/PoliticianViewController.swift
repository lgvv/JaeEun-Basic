//
//  PoliticianViewController.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

class PoliticianViewController: UIViewController {
    private let disposeBag = DisposeBag()
    enum Reusable {
        static let card = ReusableCell<PoliticianCardCell>()
    }
    
    var viewModel: PoliticianViewModel!
    private let dataSource = RxCollectionViewSectionedReloadDataSource<PoliticianSection>(
        configureCell: { _, collectionView, indexPath, item in
            switch item {
            case .politicianCardCell(let viewModel):
                let cell = collectionView.dequeue(Reusable.card, for: indexPath)
                cell.bind(viewModel)
                
                return cell
            }
        })
    
    
    private func bind(viewModel: PoliticianViewModel) {
        let viewWillAppear = self.rx.viewWillAppear
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let pull = collectionView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = PoliticianViewModel.Input(fetchTrigger: Driver.merge(viewWillAppear, pull))
        
        let output = viewModel.transform(input: input)
        
        disposeBag.insert {
            output.politicians.drive(collectionView.rx.items(dataSource: self.dataSource))
        }
    }
    
    init(viewModel: PoliticianViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
        
        self.configureUI()
        self.configureNavigationItem()
        
        self.bind(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIComponents
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(Reusable.card)
        cv.refreshControl = UIRefreshControl()
        
        return cv
    }()
}

extension PoliticianViewController {
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
    
    func configureNavigationItem() {
        
    }
}
