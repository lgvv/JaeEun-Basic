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
        let helper = jsonHelper()
        let data = helper.loadLocalFile()
        helper.parsejson(Welcome.self, data: data)
    }
    
    // MARK: - Read
    
    enum ReadType {
        case all
    }
    
    private func read(forType: ReadType) {
        
    }
}

public class jsonHelper {
    func loadLocalFile() -> Data? {
        // 1. 로컬 파일 로드하기
        let fileName: String = "MayorOfSeoulGu"
        let extensionType: String = "json"
        
        guard let fileLoaction = Bundle.main.url(
            forResource: fileName,
            withExtension: extensionType
        ) else {
            print("AAAA")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileLoaction)
            return data
        } catch {
            print("여기서잡힘")
            return nil
        }
    }
    
    func parsejson<T:Codable>(_ type: T.Type, data: Data?) {
        guard let data = data else {
            print("out")
            return
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            print(" result \(result)")
            
        } catch {
            print("ERROR")
        }
        
        print(" 나는요")
        
    }
}

struct Welcome: Codable {
    let mayor: Mayor
}

// MARK: - Mayor
struct Mayor: Codable {
    let seoul: [Busan]
}

// MARK: - Busan
struct Busan: Codable {
    let gu, name: String
    let party: Party
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case gu, name, party
        case imageURL = "image_url"
    }
}

enum Party: String, Codable {
    case 국민의힘 = "국민의힘"
    case 더불어민주당 = "더불어민주당"
}
