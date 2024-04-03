//
//  DashboardModels.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

enum Dashboard {
    
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

//MARK: Sections for table view
internal enum Sections: CaseIterable {
    case stories
    case tariffSpeedCards
    case allOperations
}
