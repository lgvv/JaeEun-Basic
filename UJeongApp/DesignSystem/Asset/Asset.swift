//
//  Asset.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/20.
//

// https://minsone.github.io/programming/bundling-resources-with-a-swift-package
import UIKit

public enum Asset: String {
    case none
}

public extension UIImage {
    convenience init?(_ asset: Asset) {
//        self.init(named: asset.rawValue, in: Bundle.module, with: nil)
        self.init(named: asset.rawValue, in: Bundle.main, with: nil)
    }

    convenience init?(assetName: String) {
//        self.init(named: assetName, in: Bundle.module, with: nil)
        self.init(named: assetName, in: Bundle.main, with: nil)
    }
}
