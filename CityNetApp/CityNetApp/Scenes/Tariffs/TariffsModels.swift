//
//  TariffsModels.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

enum Tariffs {
    
    // MARK: Use cases
  
    enum Load {
        
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
    }
}


enum TariffType {
    case internet
    case internetTV
    case internetTVPhone
}

struct Tariff {
    let type: TariffType
    let title: String
    let speedText: String
    let priceText: String
    let speedImage: UIImage
}
