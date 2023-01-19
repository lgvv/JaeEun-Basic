//
//  LocalStringFileService.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/18.
//

import Foundation

protocol LocalStringFileServiceProtocol {
    func getAllPolitician() -> [Politician.Mayor.Infomation]
}

final class LocalStringFileService: LocalStringFileServiceProtocol {
    private let jsonHelper = JSONHelper()
    
    func getAllPolitician() -> [Politician.Mayor.Infomation] {
        let loadedfile = jsonHelper.loadLocalFile("MayorOfSeoulGu",
                                                  .json)
        let result = jsonHelper.parsejson(Politician.self,
                             data: loadedfile)
       
        print("result \(result)")
        return result?.mayor.seoul.map { $0 } ?? []
    }
}
