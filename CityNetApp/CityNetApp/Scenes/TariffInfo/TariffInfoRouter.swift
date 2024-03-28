//
//  TariffInfoRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

@objc protocol TariffInfoRoutingLogic {
    
    //func routeToSomewhere()
}

protocol TariffInfoDataPassing {
    var dataStore: TariffInfoDataStore? { get }
}

final class TariffInfoRouter: NSObject, TariffInfoRoutingLogic, TariffInfoDataPassing {
    
    weak var viewController: TariffInfoViewController?
    var dataStore: TariffInfoDataStore?
  
    
    // MARK: Routing

//    func routeToSomewhere() {
//        let destinationVC = SomewhereViewController()
//        SomewhereConfigurator.configure(destinationVC)
//
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }

    
    // MARK: Navigation

//    func navigateToSomewhere(source: TariffInfoViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: TariffInfoDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
