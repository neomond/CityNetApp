//
//  ProfitAddressDetailConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

final class ProfitAddressDetailConfigurator {
    
    @discardableResult
    static func configure(_ viewController: ProfitAddressDetailViewController) -> ProfitAddressDetailViewController {
        let view = ProfitAddressDetailView()
        let interactor = ProfitAddressDetailInteractor()
        let presenter = ProfitAddressDetailPresenter()
        let router = ProfitAddressDetailRouter()
        
        viewController.mainView = view
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
