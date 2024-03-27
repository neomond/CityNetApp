//
//  SupportRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

@objc protocol SupportRoutingLogic {
    
    //func routeToSomewhere()
}

protocol SupportDataPassing {
    var dataStore: SupportDataStore? { get }
}

final class SupportRouter: NSObject, SupportRoutingLogic, SupportDataPassing {
    
    weak var viewController: SupportViewController?
    var dataStore: SupportDataStore?
  
    
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

//    func navigateToSomewhere(source: SupportViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: SupportDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
