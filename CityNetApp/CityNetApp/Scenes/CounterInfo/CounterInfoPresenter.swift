//
//  CounterInfoPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

protocol CounterInfoPresentationLogic {
    
    func presentLoad(response: CounterInfo.Load.Response)
}

final class CounterInfoPresenter: CounterInfoPresentationLogic {
    
    weak var viewController: CounterInfoDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: CounterInfo.Load.Response) {
        let viewModel = CounterInfo.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
