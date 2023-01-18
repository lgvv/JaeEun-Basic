//
//  JsonHelper.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/18.
//

import Foundation

public class JsonHelper {
    enum ExtensionType: String {
        case json
    }
    
    func loadLocalFile(_ filename: String, _ extensionType: ExtensionType) -> Data? {
        
        guard let fileLoaction = Bundle.main.url(
            forResource: filename,
            withExtension: extensionType.rawValue
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
    
    func parsejson<T:Codable>(_ type: T.Type, data: Data?) -> T? {
        guard let data = data else {
            print("out")
            return nil
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            print(" result \(result)")
            return result
            
        } catch {
            print("ERROR")
            return nil
        }
        
        print(" 나는요")
    }
}
