//
//  AddressDetailAction.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

enum AddressDetailAction: CaseIterable {
    case sameAddressUsers
    case editTariff
    case deleteAddress
    
    
    var image: UIImage? {
        switch self {
        case .sameAddressUsers:
            AppAssets.user.load()
        case .editTariff:
            AppAssets.settings.load()
        case .deleteAddress:
            AppAssets.trash.load()
        }
    }
    
    var title: String {
        switch self {
        case .sameAddressUsers:
            "Eyni ünvan istifadəçiləri"
        case .editTariff:
            "Tarifdə düzəliş"
        case .deleteAddress:
            "Ünvanı siyahıdan sil"
        }
    }
    
    var subtitle: String {
        switch self {
        case .sameAddressUsers:
            "Ortaq ünvan istifadəçiləri əlavə et"
        case .editTariff:
            "Tarifinə əlavələr et və ya dəyiş"
        case .deleteAddress:
            "Ünvanı silmək abunəliyini dayandırmır"
        }
    }
}
