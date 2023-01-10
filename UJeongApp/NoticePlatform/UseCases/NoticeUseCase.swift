//
//  NoticeUseCase.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2022/12/31.
//

import Foundation
import RxSwift

protocol NoticeUseCase {
    func fetchNotice() -> Observable<SearchInfomation>
}

final class NoticeUseCaseImpl: NoticeUseCase {
    private let noticeRepository: NoticeRepository
    
    init(noticeRepository: NoticeRepository) {
        self.noticeRepository = noticeRepository
    }
    
    func fetchNotice() -> Observable<SearchInfomation> {
        return noticeRepository.getSearchRepository()
    }
}
