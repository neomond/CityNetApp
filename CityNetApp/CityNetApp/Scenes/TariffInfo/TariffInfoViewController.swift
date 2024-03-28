//
//  TariffInfoViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

protocol TariffInfoDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: TariffInfo.Load.ViewModel)
}

final class TariffInfoViewController: UIViewController {
    
    var mainView: TariffInfoView?
    var interactor: TariffInfoBusinessLogic?
    var router: (TariffInfoRoutingLogic & TariffInfoDataPassing)?
  
    
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
  
    
    // MARK: Hide the navigation bar for this view controller

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // MARK: Show the navigation bar again when leaving this view controller
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Public Methods
  
    func load() {
        let request = TariffInfo.Load.Request()
        interactor?.load(request: request)
    }
    
    
}

// MARK: - Display Logic

extension TariffInfoViewController: TariffInfoDisplayLogic {
    
    func displayLoad(viewModel: TariffInfo.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension TariffInfoViewController: TariffInfoViewDelegate {
    
}
