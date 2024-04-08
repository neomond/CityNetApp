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
    
    
    var transactions: [TransactionModel] = [
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 40", amount: 37.99, date: "20 May 2023", type: .topUp),
        .init(title: "Bakı, Aşıq Alı 40", amount: 10.99, date: "21 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .topUp),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 45", amount: 17.99, date: "23 May 2023", type: .topUp),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .monthlyPayment),
        .init(title: "Bakı, Aşıq Alı 40", amount: 17.99, date: "23 May 2023", type: .topUp),
    ]
    
    var addresses: [AddressModel] = .init(repeating: .init(addressType: .notAvailable, status: .active, address: "Bakı, Aşıq Alı 40", tariffName: "İnternet (50 Mb/s) + TV", renewalDate: "15.05.2023", monthlyPayment: 27.99, balance: 14.22, subscriptions: "İnternet + TV + Telefon xətti", additions: ["Statik IP", "TV Box"], subscriberID: "56456-34743-37746"), count: 2)
    
    
    
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
        print("viewWillAppear")
        mainView?.addressesView.collectionView.reloadData()
        
    }
    
    //MARK: show navigation bar
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addresses.append(.init(addressType: .available, status: .pending, address: "Bakı, Aşıq Alı 40", tariffName: "İnternet (50 Mb/s) + TV", renewalDate: "15.05.2023", monthlyPayment: 27.99, balance: 14.22, subscriptions: "İnternet + TV + Telefon xətti", additions: ["Statik IP", "TV Box"], subscriberID: "56456-34743-37746"))
        
        mainView?.tableView.delegate = self
        mainView?.tableView.dataSource = self
        mainView?.addressesView.collectionView.dataSource = self
        mainView?.addressesView.collectionView.delegate = self
        
        self.load()
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

extension DashboardViewController:  DashboardViewDelegate {}


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
            self.transactions.isEmpty ? 1 : self.transactions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Sections.allCases[indexPath.section] {
            
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reuseIdentifier, for: indexPath)
            
            return cell
            
        case .tariffSpeedCards:
            let cell = tableView.dequeueReusableCell(withIdentifier: SpeedCardsTableViewCell.reuseIdentifier, for: indexPath) as! SpeedCardsTableViewCell
            return cell
            
        case .allOperations:
            
            if self.transactions.isEmpty {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: NoOperationsTableViewCell.reuseIdentifier, for: indexPath) as! NoOperationsTableViewCell
                
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: OperationsTableViewCell.reuseIdentifier, for: indexPath) as! OperationsTableViewCell
                
                cell.model = self.transactions[indexPath.row]
                return cell
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections.allCases[indexPath.section] {
        case .stories:
            155
        default:
            UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch Sections.allCases[section] {
        case .allOperations:
            AllOperationsHeaderView()
        default:
            nil
        }
    }
    
}

// MARK: - CollectionView DataSource & Delegate

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdressCollectionViewCell.reuseIdentifier, for: indexPath) as! AdressCollectionViewCell
        
        let model = addresses[indexPath.row]
        cell.addressModel = model
        
        cell.startAnimation()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = addresses[indexPath.row]
        
        switch model.addressType {
        case .available:
            router?.routeToAddressDetail(with: model)
            
        case .notAvailable:
            router?.routeToProfitAddress()
        }
    }
}


//MARK: - SpeedCardsTableViewCellDelegate

extension DashboardViewController: SpeedCardsTableViewCellDelegate {
    func goToTariffTab() {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 2
        }
    }
}
