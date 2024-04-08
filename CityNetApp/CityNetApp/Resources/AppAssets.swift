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
   
    case guestSet
    case cartSet
    case moneySet
    
    case bgMain
    case purseImage
    case settingsIcon
    
    case speedImage40
    case speedImage50
    case speedImage100
    
    case storyImg
    case addFile
    case homeWifi
    
    case speedIcon
    case wifiIcon
    case fiberOptikIcon
    
    case brandLogo
    
    case home_wifi
    case speed_test
    case calendar
    case receipt
    case wallet_outlined
    case home_add
    case basket
    case shield_check
    case copy
    case arrow_forward
    
    case user
    case settings
    case trash
    case arrowDown
    
    case profitBg
    case coin
  
}

extension AppAssets {
    func load() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
