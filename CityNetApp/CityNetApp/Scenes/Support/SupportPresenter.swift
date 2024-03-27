//
//  SupportPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol SupportPresentationLogic {
    
    func presentLoad(response: Support.Load.Response)
}

final class SupportPresenter: SupportPresentationLogic {
    
    weak var viewController: SupportDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Support.Load.Response) {
        let viewModel = Support.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
