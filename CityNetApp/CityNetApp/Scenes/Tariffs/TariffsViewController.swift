//
//  TariffsViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol TariffsDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Tariffs.Load.ViewModel)
}

final class TariffsViewController: UIViewController {
    
    var mainView: TariffsView?
    var interactor: TariffsBusinessLogic?
    var router: (TariffsRoutingLogic & TariffsDataPassing)?
  
    
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
    
   
    private func addSubviews() {
        //self.updateConstraints()
    }
  
    // MARK: - Public Methods
  
    func load() {
        let request = Tariffs.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension TariffsViewController: TariffsDisplayLogic {
    
    func displayLoad(viewModel: Tariffs.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension TariffsViewController: TariffsViewDelegate {}
