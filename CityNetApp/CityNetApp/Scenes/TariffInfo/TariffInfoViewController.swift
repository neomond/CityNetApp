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
    
    
    var serviceList: [ServiceOptionType] = [
        .init(type: .staticIP, cost: "5 ₼ / Aylıq"),
        .init(type: .additionalTVBox, cost: "5 ₼ / Aylıq")
    ]
    
    enum Sections: CaseIterable {
        case title
        case toastView
        case cardView
        case additionalServices
        
    }
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavbar()
       
        self.mainView?.tableView.dataSource = self
        self.mainView?.tableView.delegate = self
        self.load()
        
    }
    
    private func setupNavbar() {
        self.showBackButton = true
        self.title = "Step 3 of 4"
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


//MARK: - UITableViewDataSource, UITableViewDelegate

extension TariffInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections.allCases[indexPath.section] {
            
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reuseIdentifier, for: indexPath) as! TitleTableViewCell
            return cell
            
        case .toastView:
            let cell = tableView.dequeueReusableCell(withIdentifier: ToastTableViewCell.reuseIdentifier, for: indexPath) as! ToastTableViewCell
            return cell
            
        case .cardView:
            let cell = tableView.dequeueReusableCell(withIdentifier: TariffTableViewCell.reuseIdentifier, for: indexPath) as! TariffTableViewCell
            cell.contentView.backgroundColor = .white
            cell.model = router?.dataStore?.tariffModel
            return cell
            
        case .additionalServices:
            let cell = tableView.dequeueReusableCell(withIdentifier: AdditionalServiceViewCell.reuseIdentifier, for: indexPath) as! AdditionalServiceViewCell
            
            cell.serviceList = serviceList
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch Sections.allCases[section] {
        case .title:
            UIView()
        case .additionalServices:
            ExtraServicesSectionHeaderView()
        default:
            nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch Sections.allCases[section] {
        case .title:
            24
        case .additionalServices:
                32
        default:
                .zero
        }
    }
}



extension TariffInfoViewController: AdditionalServiceViewCellDelegate {
    func onDeleteBtnTap() {
        self.serviceList.removeAll { $0.type == .staticIP }
        self.mainView?.tableView.reloadData()
    }
}
