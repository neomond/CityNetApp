//
//  DashboardViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

protocol DashboardDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Dashboard.Load.ViewModel)
}

final class DashboardViewController: UIViewController {
    
    var mainView: DashboardView?
    var interactor: DashboardBusinessLogic?
    var router: (DashboardRoutingLogic & DashboardDataPassing)?
    
    
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
    
//    MARK: Hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
//    MARK: Show the navigation bar when leaving the DashboardViewController
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
     
    
    // MARK: - Public Methods
    
    func load() {
        let request = Dashboard.Load.Request()
        interactor?.load(request: request)
    }
}

// MARK: - Display Logic

extension DashboardViewController: DashboardDisplayLogic {
    
    func displayLoad(viewModel: Dashboard.Load.ViewModel) { }
}

// MARK: - View Delegate

extension DashboardViewController: DashboardViewDelegate {
    
}
