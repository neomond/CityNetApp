//
//  Cell+Configurer.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
