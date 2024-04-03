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
    
    var initialTableViewTopConstraint: CGFloat = 368
    var maxScrollOffset: CGFloat = 100
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.tableView.delegate = self
        mainView?.tableView.dataSource = self
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

// MARK: - View Delegate, View DataSource

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections.allCases[section] {
        case .stories, .tariffSpeedCards:
            1
        case .allOperations:
            1
            //            self.transactions.isEmpty ? 1 : self.transactions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseIdentifier, for: indexPath) as? StoriesTableViewCell else {
        //                return UITableViewCell()
        //            }
        //            return cell
        
        switch Sections.allCases[indexPath.section] {
            
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseIdentifier, for: indexPath)
            
            return cell
        case .tariffSpeedCards:
            let cell = tableView.dequeueReusableCell(withIdentifier: SpeedCardsTableViewCell.reuseIdentifier, for: indexPath) as! SpeedCardsTableViewCell
            return cell
            
        case .allOperations:
            return UITableViewCell()
            //            if self.transactions.isEmpty {
            //
            //                let cell = tableView.dequeueReusableCell(withIdentifier: NoTransactionTableViewCell.reuseIdentifier, for: indexPath) as! NoTransactionTableViewCell
            //
            //                return cell
            //            }
            //            else {
            //                let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.reuseIdentifier, for: indexPath) as! TransactionTableViewCell
            //
            //                cell.model = self.transactions[indexPath.row]
            //                return cell
            //
            //            }
        }
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch Sections.allCases[indexPath.section] {
            case .stories:
                152.0 + 32.0
            default:
                UITableView.automaticDimension
            }
        }
        
//        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            switch Sections.allCases[section] {
//            case .allOperations:
//                AllTransactionsHeaderView()
//            default:
//                nil
//            }
//        }
        
    }

