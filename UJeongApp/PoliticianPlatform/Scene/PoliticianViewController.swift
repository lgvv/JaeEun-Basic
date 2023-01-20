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
                cell.bind(viewModel: viewModel)
                
                return cell
            }
        })
    
    
    private func bind(viewModel: PoliticianViewModel) {
        let viewWillAppear = self.rx.viewWillAppear
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = PoliticianViewModel.Input(fetchTrigger: Driver.merge(viewWillAppear))
        
        let output = viewModel.transform(input: input)
        
        disposeBag.insert {
            output.politicians
                .drive(collectionView.rx.items(dataSource: self.dataSource))
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
        let layout = UICollectionViewFlowLayout()
        
        var cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.showsVerticalScrollIndicator = false
        
        cv.register(Reusable.card)
        
        return cv
    }()
}

extension PoliticianViewController {
    func configureUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureNavigationItem() {
        navigationItem.title = "의원"
    }
}

extension PoliticianViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * 10/7 + textAreaHeight
        
        return CGSize(width: width, height: height)
    }
}
