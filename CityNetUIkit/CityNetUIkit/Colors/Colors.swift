//
//  Colors.swift
//  CityNetUIkit
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

public enum ColorStyle: String, CaseIterable {
    
    // MARK: - Colors
    
    case main           = "carmineMain"
    case black          = "blackMain"
}

extension ColorStyle {
    
    func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}
