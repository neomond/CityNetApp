//
//  AddressDetailConfigurator.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

final class AddressDetailConfigurator {
    
    @discardableResult
    static func configure(_ viewController: AddressDetailViewController) -> AddressDetailViewController {
        let view = AddressDetailView()
        let interactor = AddressDetailInteractor()
        let presenter = AddressDetailPresenter()
        let router = AddressDetailRouter()
        
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
