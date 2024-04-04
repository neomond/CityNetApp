//
//  CounterInfoRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

@objc protocol CounterInfoRoutingLogic {
    
    //func routeToSomewhere()
}

protocol CounterInfoDataPassing {
    var dataStore: CounterInfoDataStore? { get }
}

final class CounterInfoRouter: NSObject, CounterInfoRoutingLogic, CounterInfoDataPassing {
    
    weak var viewController: CounterInfoViewController?
    var dataStore: CounterInfoDataStore?
  
    
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

//    func navigateToSomewhere(source: CounterInfoViewController, destination: SomewhereViewController) {
//        source.show(destination, sender: nil)
//    }

    
    // MARK: Passing data

//    func passDataToSomewhere(source: CounterInfoDataStore, destination: inout SomewhereDataStore) {
//        destination.name = source.name
//    }
}
