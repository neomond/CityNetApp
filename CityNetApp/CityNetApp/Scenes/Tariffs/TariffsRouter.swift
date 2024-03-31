//
//  TariffsRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol TariffsRoutingLogic {
    
    func routeToTariffInfo(model: TariffModel)
}

protocol TariffsDataPassing {
    var dataStore: TariffsDataStore? { get }
}

final class TariffsRouter: NSObject, TariffsRoutingLogic, TariffsDataPassing {
    
    weak var viewController: TariffsViewController?
    var dataStore: TariffsDataStore?
  
    
    // MARK: Routing

    func routeToTariffInfo(model: TariffModel) {
        let destinationVC = TariffInfoViewController()
        TariffInfoConfigurator.configure(destinationVC)
        
        dataStore?.tariffModel = model
        var destinationDS = destinationVC.router!.dataStore!
        destinationVC.hidesBottomBarWhenPushed = true
        passDataToTariffInfo(source: dataStore!, destination: &destinationDS)
       
        navigateToTariffInfo(source: viewController!, destination: destinationVC)
    }

    
    // MARK: Navigation

    func navigateToTariffInfo(source: TariffsViewController, destination: TariffInfoViewController) {
        source.show(destination, sender: nil)
    }


    // MARK: Passing data
    func passDataToTariffInfo(source: TariffsDataStore, destination: inout TariffInfoDataStore) {
        destination.tariffModel = source.tariffModel
    }
}
