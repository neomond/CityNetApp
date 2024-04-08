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
    case paleBlue       = "paleBlue"
    case grayPrimary    = "grayPrimary"
    case paleYellow     = "paleYellow"
    case paleCarmine    = "paleCarmine"
    case graySecondary  = "graySecondary"
    case grayTertiary   = "grayTertiary"
    case whitePrimary   = "whitePrimary"
    case paleBlack      = "paleBlack"
    case charcoalGray   = "charcoalGray"
    case callOut        = "callOut"
    case greenDark      = "greenDark"
    case slate          = "slate"
    case cardBg         = "cardBg"
    case gravel         = "gravel"
}

extension ColorStyle {
    
   public func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}
