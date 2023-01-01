//
//  UseCaseProvider.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import Foundation

public final class NoticeUseCaseProvider: UseCaseProvider {
    private let noticeRepository: NoticeRepository
    
    init() {
        noticeRepository = NoticeRepositoryImpl()
    }
    
    func makeNoticeUseCase() -> NoticeUseCase {
        return NoticeUseCaseImpl(noticeRepository: noticeRepository)
    }
}
