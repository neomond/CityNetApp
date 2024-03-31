//
//  TariffModel.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

struct TariffModel {
    let name: String
    let image: UIImage?
    let type: TariffModelType
    let tariffInfos: [TariffInfoType]
    let price: String
    
}

enum TariffModelType {
    case internet
    case internetAndTV
    case internetAndTVAndPhoneLine
    
    var color: UIColor? {
        switch self {
        case .internet:
            ColorStyle.paleBlue.load()
        case .internetAndTV:
            ColorStyle.paleYellow.load()
        case .internetAndTVAndPhoneLine:
            ColorStyle.paleCarmine.load()
        }
    }
}

enum TariffInfoType {
    case fiberOptic
    case speed(amount: String)
    case freeWifiRouter
    case tvBox
    case channels(count: Int)
    case homePhoneLine
    
    var image: UIImage? {
        switch self {
        case .fiberOptic:
            AppAssets.fiberOptikIcon.load()
        case .speed(_):
            AppAssets.speedIcon.load()
        case .freeWifiRouter:
            AppAssets.wifiIcon.load()
        case .tvBox:
            AppAssets.tvboxIcon.load()
        case .channels(_):
            AppAssets.channelIcon.load()
        case .homePhoneLine:
            AppAssets.cellPhoneIcon.load()
        }
    }
    
    var title: String {
        switch self {
        case .fiberOptic:
            "Fiber optik"
        case .speed(let amount):
            "\(amount) sürət"
        case .freeWifiRouter:
            "Wi-Fi ruter (PULSUZ)"
        case .tvBox:
            "TV Box"
        case .channels(let count):
            "\(count) kanal"
        case .homePhoneLine:
            "Ev telefonu xətti"
        }
    }
}
