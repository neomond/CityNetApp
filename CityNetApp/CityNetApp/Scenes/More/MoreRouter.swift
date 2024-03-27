//
//  MoreRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

@objc protocol MoreRoutingLogic {
    
    //func routeToSomewhere()
}

protocol MoreDataPassing {
    var dataStore: MoreDataStore? { get }
}

final class MoreRouter: NSObject, MoreRoutingLogic, MoreDataPassing {
    
    weak var viewController: MoreViewController?
    var dataStore: MoreDataStore?
  
    
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

//    func navigateToSomewhere(source: MoreViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: MoreDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
