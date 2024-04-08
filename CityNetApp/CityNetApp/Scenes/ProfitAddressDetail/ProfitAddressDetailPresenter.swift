//
//  ProfitAddressDetailPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol ProfitAddressDetailPresentationLogic {
    
    func presentLoad(response: ProfitAddressDetail.Load.Response)
}

final class ProfitAddressDetailPresenter: ProfitAddressDetailPresentationLogic {
    
    weak var viewController: ProfitAddressDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: ProfitAddressDetail.Load.Response) {
        let viewModel = ProfitAddressDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
