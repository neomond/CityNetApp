//
//  Cell+Configurer.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit
import CityNetUIkit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
extension UITableViewCell: CellConfigurer { }


extension UITableViewCell {
    func setupCell(with color: UIColor? = nil) {
        self.contentView.backgroundColor = color ?? .white
        self.selectionStyle = .none
    }
}
