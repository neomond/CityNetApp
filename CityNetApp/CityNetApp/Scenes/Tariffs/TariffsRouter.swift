//
//  TariffsRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

@objc protocol TariffsRoutingLogic {
    
    //func routeToSomewhere()
}

protocol TariffsDataPassing {
    var dataStore: TariffsDataStore? { get }
}

final class TariffsRouter: NSObject, TariffsRoutingLogic, TariffsDataPassing {
    
    weak var viewController: TariffsViewController?
    var dataStore: TariffsDataStore?
  
    
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

//    func navigateToSomewhere(source: TariffsViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: TariffsDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
