//
//  UseCaseProvider.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import Foundation

protocol NoticeUseCaseProviderProtocol {
    func makeNoticeUseCase() -> NoticeUseCase
}

public final class NoticeUseCaseProvider: NoticeUseCaseProviderProtocol {
    private let noticeRepository: NoticeRepository
    
    init() {
        self.noticeRepository = NoticeRepositoryImpl()
    }
    
    func makeNoticeUseCase() -> NoticeUseCase {
        return NoticeUseCaseImpl(noticeRepository: noticeRepository)
    }
}
