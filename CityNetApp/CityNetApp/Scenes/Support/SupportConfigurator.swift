//
//  SupportConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

final class SupportConfigurator {
    
    @discardableResult
    static func configure(_ viewController: SupportViewController) -> SupportViewController {
        let view = SupportView()
        let interactor = SupportInteractor()
        let presenter = SupportPresenter()
        let router = SupportRouter()
        
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
