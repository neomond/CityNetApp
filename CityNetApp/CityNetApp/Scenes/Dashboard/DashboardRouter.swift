//
//  DashboardRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

protocol DashboardRoutingLogic {
    
    func routeToProfitAddress()
    func routeToAddressDetail(with model: AddressModel)
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

final class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing {
    
    weak var viewController: DashboardViewController?
    var dataStore: DashboardDataStore?
  
    
    // MARK: Routing
    
    func routeToProfitAddress() {
        let destinationVC = ProfitAddressDetailViewController()
        
        ProfitAddressDetailConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToProfitDetail(source: dataStore!, destination: &destinationDS)

        navigateToProfitDetail(source: viewController!, destination: destinationVC)
    }

    func routeToAddressDetail(with model: AddressModel) {
        let destinationVC = AddressDetailViewController()
        AddressDetailConfigurator.configure(destinationVC)
        dataStore?.addressModel = model
        var destinationDS = destinationVC.router!.dataStore!
        passDataToAddressDetail(source: dataStore!, destination: &destinationDS)

        navigateToAddressDetail(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation
    func navigateToProfitDetail(source: DashboardViewController, destination: ProfitAddressDetailViewController) {
        source.show(destination, sender: nil)
    }
    
    func navigateToAddressDetail(source: DashboardViewController, destination: AddressDetailViewController) {
        destination.hero.isEnabled = true
//        destination.heroModalAnimationType = .fade
        source.present(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToProfitDetail(source: DashboardDataStore, destination: inout ProfitAddressDetailDataStore) {
//        destination.name = source.name
    }

    
    func passDataToAddressDetail(source: DashboardDataStore, destination: inout AddressDetailDataStore) {
        destination.addressModel = source.addressModel
    }
}
