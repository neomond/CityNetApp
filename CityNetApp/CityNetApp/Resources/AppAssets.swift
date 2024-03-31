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
    case infoIcon
    case cellPhoneIcon
    case channelIcon
    case ipIcon
    case tvboxIcon
    case notificationIcon
    case plusIcon
    case backIcon
    case minusIcon
   
    case speedImage40
    case speedImage50
    case speedImage100
    
    case speedIcon
    case wifiIcon
    case fiberOptikIcon
    
    case brandLogo
    
    
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
