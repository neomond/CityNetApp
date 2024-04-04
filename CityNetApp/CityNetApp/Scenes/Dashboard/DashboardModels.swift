//
//  DashboardModels.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit
import CityNetUIkit

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



internal struct TransactionModel {
    let title: String
    let amount: Double
    let date: String
    let type: TransactionType
}

internal enum TransactionType {
    case monthlyPayment
    case topUp
    
    var title: String {
        switch self {
        case .monthlyPayment:
            "Aylıq ödəniş"
        case .topUp:
            "Balans artımı"
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .monthlyPayment:
            AppAssets.homeWifi.load()
        case .topUp:
            AppAssets.plusIcon.load()
        }
    }
    
    var amountColor: ColorStyle {
        switch self {
        case .monthlyPayment:
            ColorStyle.charcoalGray
        case .topUp:
            ColorStyle.callOut
        }
    }
}
