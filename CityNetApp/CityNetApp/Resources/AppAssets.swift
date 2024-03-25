//
//  AppAssets.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

public enum AppAssets: String, CaseIterable {
    
    case homeIcon
   
    
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
