//
//  FirebaseDelegate.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/17.
//

import Foundation
import FirebaseDatabase

public class FirebaseDatabaseService {
    var ref: DatabaseReference!
    let helper = JsonHelper()
    
    init() {
        ref = Database.database().reference()
    }
    
    // MARK: - Write
    func write() {
        print("나는 불립니다요")
//        self.ref.child("politician").setValue(["username":"강감찬."])
        let data = helper.loadLocalFile("MayorOfSeoulGu", .json)
        let result = helper.parsejson(Politician.self, data: data)
        result?.mayor.seoul.forEach { item in
            print(item)
        }
        
        FirebaseAutoWriteModule().write_서울_구청장_데이터()
    }
    
    // MARK: - Read
    
    enum ReadType {
        case all
    }
    
    private func read(forType: ReadType) {
        
    }
}

class FirebaseAutoWriteModule {
    let serivce = FirebaseDatabaseService()

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
