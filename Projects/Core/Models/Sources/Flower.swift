//
//  Flower.swift
//  CoreKit
//
//  Created by Hamlit Jason on 2023/02/11.
//  Copyright © 2023 Curation-Corporation. All rights reserved.
//

import Foundation

public struct Flower {
    
    public var id: String // 고유 아이디
    public var name: String // 꽃 이름
    public var floriography: String // 꽃말
    public var thumnailImage: String // 썸네일 이미지
    public var reladtedImages: [String] // 포스팅 된 이미지 (최대 3장)
    public var story: String // 스토리
    public var isBookmark: Bool // 북마크
    
    public init(id: String,
                name: String,
                floriography: String,
                thumnailImage: String,
                reladtedImages: [String],
                story: String,
                isBookmark: Bool = false) {
        self.id = id
        self.name = name
        self.floriography = floriography
        self.thumnailImage = thumnailImage
        self.reladtedImages = reladtedImages
        self.story = story
        self.isBookmark = isBookmark
    }
}
