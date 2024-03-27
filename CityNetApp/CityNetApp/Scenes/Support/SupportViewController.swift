//
//  SupportViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol SupportDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Support.Load.ViewModel)
}

final class SupportViewController: UIViewController {
    
    var mainView: SupportView?
    var interactor: SupportBusinessLogic?
    var router: (SupportRoutingLogic & SupportDataPassing)?
  
    
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
        let request = Support.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension SupportViewController: SupportDisplayLogic {
    
    func displayLoad(viewModel: Support.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension SupportViewController: SupportViewDelegate {
    
}
