//
//  AddressDetailPresenter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol AddressDetailPresentationLogic {
    
    func presentLoad(response: AddressDetail.Load.Response)
}

final class AddressDetailPresenter: AddressDetailPresentationLogic {
    
    weak var viewController: AddressDetailDisplayLogic?
  
    
    // MARK: Presentation
  
    func presentLoad(response: AddressDetail.Load.Response) {
        let viewModel = AddressDetail.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
    }
}
