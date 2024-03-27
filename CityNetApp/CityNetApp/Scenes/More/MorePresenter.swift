//
//  MorePresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol MorePresentationLogic {
    
    func presentLoad(response: More.Load.Response)
}

final class MorePresenter: MorePresentationLogic {
    
    weak var viewController: MoreDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: More.Load.Response) {
        let viewModel = More.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
