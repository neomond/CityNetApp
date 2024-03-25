//
//  DashboardPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

protocol DashboardPresentationLogic {
    
    func presentLoad(response: Dashboard.Load.Response)
}

final class DashboardPresenter: DashboardPresentationLogic {
    
    weak var viewController: DashboardDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Dashboard.Load.Response) {
        let viewModel = Dashboard.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
