//
//  ServiceOptionType.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit

 struct ServiceOptionType {
    let type: ServiceKindType
    let cost: String
}

 enum ServiceKindType {
    case staticIP
    case additionalTVBox
    
    var title: String {
        switch self {
        case .staticIP:
            return "Statik IP"
        case .additionalTVBox:
            return "Əlavə TV Box cihazı"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .staticIP:
            return AppAssets.ipIcon.load()
        case .additionalTVBox:
            return AppAssets.tvboxIcon.load()
        }
    }
    
    var description: String {
        switch self {
        case .staticIP:
            return "Müşahidə kameraları, şəbəkə oyunları, fayl mübadiləsi və bir çox yöndə istifadə edilir."
        case .additionalTVBox:
            return "Əlavə TV Box cihazı alaraq, birdən çox televizora paylaya bilərsən."
        }
    }
}
