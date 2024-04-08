//
//  ProfitAddressDetailRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

 protocol ProfitAddressDetailRoutingLogic {
    
    //func routeToSomewhere()
}

protocol ProfitAddressDetailDataPassing {
    var dataStore: ProfitAddressDetailDataStore? { get }
}

final class ProfitAddressDetailRouter: NSObject, ProfitAddressDetailRoutingLogic, ProfitAddressDetailDataPassing {
    
    weak var viewController: ProfitAddressDetailViewController?
    var dataStore: ProfitAddressDetailDataStore?
  
    
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

//    func navigateToSomewhere(source: ProfitAddressDetailViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: ProfitAddressDetailDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
