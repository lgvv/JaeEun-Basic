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
    
    init() {
        ref = Database.database().reference()
    }
    
    // MARK: - Write
    func write() {
        //
    }
}
