//
//  FirebaseAutoWriteModule.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/18.
//

import Foundation

/*
 리얼타임 데이터베이스에서 배열 형식의 구조를 사용할 수 없다.
 따라서 구조가 json파일과 다름을 유의
 
 서버 개발에 더 익숙해진다면 적용예정
 */

class FirebaseAutoWriteModule {
    let serivce = FirebaseDatabaseService()

    @available(swift, message: "파이어베이스 너무 공수가 커서 없앴습니다.")
    func write_서울_구청장_데이터() {
        let data = serivce.helper.loadLocalFile("MayorOfSeoulGu", .json)
        let result = serivce.helper.parsejson(Politician.self, data: data)

        result?.mayor.seoul.forEach { info in
            let object = [
                "gu": info.gu,
                "name": info.name,
                "party": info.party.rawValue,
                "imageUrl": info.imageUrlString
            ]

            serivce.ref.child("mayor/seoul-\(info.gu)").setValue(object)
        }
    }
}
