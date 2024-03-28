//
//  TariffInfoConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

final class TariffInfoConfigurator {
    
    @discardableResult
    static func configure(_ viewController: TariffInfoViewController) -> TariffInfoViewController {
        let view = TariffInfoView()
        let interactor = TariffInfoInteractor()
        let presenter = TariffInfoPresenter()
        let router = TariffInfoRouter()
        
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
