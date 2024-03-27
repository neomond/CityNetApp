//
//  TariffsPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol TariffsPresentationLogic {
    
    func presentLoad(response: Tariffs.Load.Response)
}

final class TariffsPresenter: TariffsPresentationLogic {
    
    weak var viewController: TariffsDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: Tariffs.Load.Response) {
        let viewModel = Tariffs.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
