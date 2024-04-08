//
//  TariffsViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit
import CityNetUIkit

protocol TariffsDisplayLogic: AnyObject {
    
    func displayLoad(viewModel: Tariffs.Load.ViewModel)
}

final class TariffsViewController: UIViewController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    
    
    
    var mainView: TariffsView?
    var interactor: TariffsBusinessLogic?
    var router: (TariffsRoutingLogic & TariffsDataPassing)?
  
    let models: [TariffModel] = [
        .init(name: "Internet", image: AppAssets.speedImage40.load(), type: .internet, tariffInfos: [
            .fiberOptic,
            .speed(amount: "40 mb/s"),
            .freeWifiRouter
            ],
              price: "37.99 ₼ / Aylıq"),
        
            .init(name: "Internet + TV", image: AppAssets.speedImage50.load(), type: .internetAndTV,  tariffInfos: [
                .fiberOptic,
                .speed(amount: "40 mb/s"),
                .freeWifiRouter,
                .tvBox,
                .channels(count: 24)
            ],
                  price: "37.99 ₼ / Aylıq"),
        .init(name: "Internet + TV + Telefon xətti", image: AppAssets.speedImage100.load(), type: .internetAndTVAndPhoneLine,
              tariffInfos: [
                .fiberOptic,
                .speed(amount: "40 mb/s"),
                .freeWifiRouter,
                .tvBox,
                .channels(count: 24),
                .homePhoneLine
            ],
              price: "37.99 ₼ / Aylıq" )
    ]
    // MARK: - Lifecycle Methods

    override func loadView() {
        super.loadView()
    
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView?.tariffsTableView.dataSource = self
        self.mainView?.tariffsTableView.delegate = self
        self.load()
    }

  
    
    // MARK: - Public Methods
  
    func load() {
        let request = Tariffs.Load.Request()
        interactor?.load(request: request)
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

}

// MARK: - Display Logic

extension TariffsViewController: TariffsDisplayLogic {
    
    func displayLoad(viewModel: Tariffs.Load.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - View Delegate

extension TariffsViewController: TariffsViewDelegate {
    
}

//MARK: UITableViewDataSource

extension TariffsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TariffTableViewCell.reuseIdentifier, for: indexPath) as!  TariffTableViewCell
        cell.contentView.backgroundColor = .white
        cell.delegate = self
        cell.hasJoinButton = true
        cell.model = models[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        TariffsTableViewHeader()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            56
    }
}


extension TariffsViewController: TariffTableViewCellDelegate {
    func onTapJoinButton(model: TariffModel) {
        self.router?.routeToTariffInfo(model: model)
    }
}
