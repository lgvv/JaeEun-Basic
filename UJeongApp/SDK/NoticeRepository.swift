//
//  NoticeRepository.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import Foundation
import RxSwift

protocol NoticeRepository {
    func getSearchRepository() -> Observable<SearchInfomation>
}

final class NoticeRepositoryImpl: NoticeRepository {
    private let apiClient: APIClient

    init(_ apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getSearchRepository() -> Observable<SearchInfomation> {
        let request = SearchRequest(q: "RxSwift", page: 1)
        let apiCall = apiClient.sendWithRx(request)
        return apiCall
    }
}
