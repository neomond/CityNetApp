//
//  DashboardInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

protocol DashboardBusinessLogic {
    
    func load(request: Dashboard.Load.Request)
}

protocol DashboardDataStore {
    
    var addressModel: AddressModel? { get set }
}

final class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore {
    var addressModel: AddressModel?

    var presenter: DashboardPresentationLogic?
    lazy var worker: DashboardWorkingLogic = DashboardWorker()
    
  
    
    // MARK: Business Logic
  
    func load(request: Dashboard.Load.Request) {
        let response = Dashboard.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
