//
//  CounterInfoConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

final class CounterInfoConfigurator {
    
    @discardableResult
    static func configure(_ viewController: CounterInfoViewController) -> CounterInfoViewController {
        let view = CounterInfoView()
        let interactor = CounterInfoInteractor()
        let presenter = CounterInfoPresenter()
        let router = CounterInfoRouter()
        
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
