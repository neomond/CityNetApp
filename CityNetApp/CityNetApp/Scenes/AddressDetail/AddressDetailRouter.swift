//
//  AddressDetailRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

@objc protocol AddressDetailRoutingLogic {
    
    //func routeToSomewhere()
}

protocol AddressDetailDataPassing {
    var dataStore: AddressDetailDataStore? { get }
}

final class AddressDetailRouter: NSObject, AddressDetailRoutingLogic, AddressDetailDataPassing {
    
    weak var viewController: AddressDetailViewController?
    var dataStore: AddressDetailDataStore?
  
    
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

//    func navigateToSomewhere(source: AddressDetailViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: AddressDetailDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
