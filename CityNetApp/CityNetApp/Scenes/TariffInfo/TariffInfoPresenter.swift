//
//  TariffInfoPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

protocol TariffInfoPresentationLogic {
    
    func presentLoad(response: TariffInfo.Load.Response)
}

final class TariffInfoPresenter: TariffInfoPresentationLogic {
    
    weak var viewController: TariffInfoDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: TariffInfo.Load.Response) {
        let viewModel = TariffInfo.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
