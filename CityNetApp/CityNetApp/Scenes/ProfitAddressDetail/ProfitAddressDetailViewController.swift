//
//  ProfitAddressDetailViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol ProfitAddressDetailDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: ProfitAddressDetail.Load.ViewModel)
}

final class ProfitAddressDetailViewController: UIViewController {
    
    var mainView: ProfitAddressDetailView?
    var interactor: ProfitAddressDetailBusinessLogic?
    var router: (ProfitAddressDetailRoutingLogic & ProfitAddressDetailDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    //MARK: Hide navigation bar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.mainView?.animatingCoinsView.startAnimating()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBackButton = false
        self.load()
        
        self.mainView?.animatingCoinsView.startAnimating()
    }
  
    
    
    // MARK: - Public Methods
  
    func load() {
        let request = ProfitAddressDetail.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension ProfitAddressDetailViewController: ProfitAddressDetailDisplayLogic {
    
    func displayLoad(viewModel: ProfitAddressDetail.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension ProfitAddressDetailViewController: ProfitAddressDetailViewDelegate {
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
