//
//  UseCaseProvider.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

import Foundation

protocol UseCaseProvider {
    func makeNoticeUseCase() -> NoticeUseCase
}
