//
//  MoreViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol MoreDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: More.Load.ViewModel)
}

final class MoreViewController: UIViewController {
    
    var mainView: MoreView?
    var interactor: MoreBusinessLogic?
    var router: (MoreRoutingLogic & MoreDataPassing)?
  
    
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
        let request = More.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension MoreViewController: MoreDisplayLogic {
    
    func displayLoad(viewModel: More.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension MoreViewController: MoreViewDelegate {
    
}
