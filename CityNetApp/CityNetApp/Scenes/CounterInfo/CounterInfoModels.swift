//
//  CounterInfoModels.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

enum CounterInfo {
    
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


struct CounterInfoRow {
    let image: UIImage
    let title: String
    let subtitle: String
}
