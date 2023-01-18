//
//  FirebaseDelegate.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/17.
//

import Foundation
import FirebaseDatabase

public class FirebaseDatabaseService {
    private var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    // MARK: - Write
    func write() {
        print("나는 불립니다요")
//        self.ref.child("politician").setValue(["username":"강감찬."])
        let helper = JsonHelper()
        let data = helper.loadLocalFile("MayorOfSeoulGu", .json)
        helper.parsejson(Politician.self, data: data)
    }
    
    // MARK: - Read
    
    enum ReadType {
        case all
    }
    
    private func read(forType: ReadType) {
        
    }
}
