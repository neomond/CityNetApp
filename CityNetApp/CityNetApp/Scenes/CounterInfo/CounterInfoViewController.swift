//
//  CounterInfoViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

protocol CounterInfoDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: CounterInfo.Load.ViewModel)
}

final class CounterInfoViewController: UIViewController {
    
    var mainView: CounterInfoView?
    var interactor: CounterInfoBusinessLogic?
    var router: (CounterInfoRoutingLogic & CounterInfoDataPassing)?
  
    
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        
        self.load()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar when leaving the DashboardViewController
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Public Methods
  
    func load() {
        let request = CounterInfo.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension CounterInfoViewController: CounterInfoDisplayLogic {
    
    func displayLoad(viewModel: CounterInfo.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension CounterInfoViewController: CounterInfoViewDelegate {
    
}
