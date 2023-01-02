//
//  PoliticianViewController.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/02.
//

import UIKit
import RxSwift
import RxCocoa

class PoliticianViewController: UIViewController {
    
    var viewModel: PoliticianViewModel!
    
    init(viewModel: PoliticianViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PoliticianViewModel: ViewModelType {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    private let useCase: PoliticianUseCase
    private let navigator: PoliticianNavigator
    
    init(useCase: PoliticianUseCase, navigator: PoliticianNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
    
}

protocol PoliticianNavigator {
    func toPolitican()
}

class DefaultPoliticianNavigator: PoliticianNavigator {
    private let navigationController: UINavigationController
    private let services: PoliticianUseCaseProvider
    
    init(
        navigationController: UINavigationController,
        services: PoliticianUseCaseProvider
    ) {
        self.navigationController = navigationController
        self.services = services
    }
    
    func toPolitican() {
        let vm = PoliticianViewModel(useCase: services.makePoliticianUseCase(), navigator: self)
        let vc = PoliticianViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}

public final class PoliticianUseCaseProvider {
    private let politicianRepository: PoliticianRepsitory
    
    init() {
        self.politicianRepository = PoliticianRepsitoryImpl()
    }
    
    func makePoliticianUseCase() -> PoliticianUseCase {
        return PoliticianUseCaseImpl(repository: politicianRepository)
    }
}

struct Politician {
    let name: String // 정치인 이름
    let party: String // 정당
    let constituency: String // 지역구
}

protocol PoliticianUseCase {
    func fetchPolitician() -> Observable<Politician>
}

final class PoliticianUseCaseImpl: PoliticianUseCase {
    private let repository: PoliticianRepsitory
    
    init(repository: PoliticianRepsitory) {
        self.repository = repository
    }
    
    func fetchPolitician() -> Observable<Politician> {
        return repository.getPoliticians()
    }
}

protocol PoliticianRepsitory {
    func getPoliticians() -> Observable<Politician>
}

final public class PoliticianRepsitoryImpl: PoliticianRepsitory {
    private let apiClient: APIClient

    init(_ apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getPoliticians() -> Observable<Politician> {
        
        return .empty()
    }
}
