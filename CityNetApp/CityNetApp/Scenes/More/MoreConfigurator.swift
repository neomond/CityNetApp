//
//  MoreConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

final class MoreConfigurator {
    
    @discardableResult
    static func configure(_ viewController: MoreViewController) -> MoreViewController {
        let view = MoreView()
        let interactor = MoreInteractor()
        let presenter = MorePresenter()
        let router = MoreRouter()
        
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
