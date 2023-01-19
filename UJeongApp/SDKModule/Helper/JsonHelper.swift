//
//  JsonHelper.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/18.
//

import Foundation

final class JSONHelper {
    enum ExtensionType: String {
        case json
    }
    
    func loadLocalFile(_ filename: String, _ extensionType: ExtensionType) -> Data? {
        
        guard let fileLoaction = Bundle.main.url(
            forResource: filename,
            withExtension: extensionType.rawValue
        ) else {
            print("🚨 이름과 확장자로 파일 만들기 실패")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileLoaction)
            return data
        } catch {
            print("🚨 데이터가 해당 경로에 없어요.")
            return nil
        }
    }
    
    func parsejson<T:Codable>(_ type: T.Type, data: Data?) -> T? {
        guard let data = data else {
            print("🚨 데이터가 nil입니다.")
            return nil
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            print("🚨 디코딩 과정에서의 에러")
            return nil
        }
    }
}
