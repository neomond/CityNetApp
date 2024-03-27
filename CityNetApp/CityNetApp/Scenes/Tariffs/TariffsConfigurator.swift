//
//  TariffsConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

final class TariffsConfigurator {
    
    @discardableResult
    static func configure(_ viewController: TariffsViewController) -> TariffsViewController {
        let view = TariffsView()
        let interactor = TariffsInteractor()
        let presenter = TariffsPresenter()
        let router = TariffsRouter()
        
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
