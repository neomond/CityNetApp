//
//  ThemeableView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit
import CityNetUIkit

protocol ThemeableView {
    var theme: ThemeProvider { get }
}

extension ThemeableView where Self: UIView {
    
    func adaptiveColor(_ style: ColorStyle) -> UIColor {
        if #available(iOS 13.0, *) {
            return theme.adaptiveColor(style, isDarkMode: self.traitCollection.userInterfaceStyle == .dark, isHighContrast: self.traitCollection.accessibilityContrast == .high)
        } else {
            return theme.adaptiveColor(style, isDarkMode: self.traitCollection.userInterfaceStyle == .dark, isHighContrast: false)
        }
    }
}
