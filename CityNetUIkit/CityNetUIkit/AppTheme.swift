//
//  AppTheme.swift
//  CityNetUIkit
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

public protocol ThemeProvider {
    
    func adaptiveColor(_ style: ColorStyle, isDarkMode: Bool, isHighContrast: Bool) -> UIColor
    
}

let bundle = Bundle(for: AppTheme.self)

public class AppTheme: ThemeProvider {
    
    public init() {}
    
    public func adaptiveColor(_ style: ColorStyle, isDarkMode: Bool, isHighContrast: Bool) -> UIColor {
        return style.load()!
    }
    
}
