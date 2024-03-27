//
//  AppAssets.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

public enum AppAssets: String, CaseIterable {
    
    case homeIcon
    case supportIcon
    case tagsIcon
    case moreIcon
   
    case speedImage40
    case speedImage50
    case speedImage100
    
    case speedIcon
    case wifiIcon
    case fiberOptikIcon
    
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
