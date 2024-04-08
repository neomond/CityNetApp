//
//  AddressDetailViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol AddressDetailDisplayLogic: AnyObject {
    func displayLoad(viewModel: AddressDetail.Load.ViewModel)
}

final class AddressDetailViewController: UIViewController {
    
    var mainView: AddressDetailView?
    var interactor: AddressDetailBusinessLogic?
    var router: (AddressDetailRoutingLogic & AddressDetailDataPassing)?
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.load()
    }
  
    
    // MARK: - Public Methods
  
    func load() {
        let request = AddressDetail.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension AddressDetailViewController: AddressDetailDisplayLogic {
    
    func displayLoad(viewModel: AddressDetail.Load.ViewModel) {
        guard let addressModel = router?.dataStore?.addressModel  else { return }
        self.mainView?.setAddress(model: addressModel)
    }
}

// MARK: - View Delegate

extension AddressDetailViewController: AddressDetailViewDelegate {
    func dismissVC() {
        self.dismiss(animated: true)
    }
}
