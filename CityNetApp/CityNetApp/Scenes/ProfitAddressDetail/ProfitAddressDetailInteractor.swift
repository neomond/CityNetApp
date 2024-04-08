//
//  ProfitAddressDetailInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol ProfitAddressDetailBusinessLogic {
    
    func load(request: ProfitAddressDetail.Load.Request)
}

protocol ProfitAddressDetailDataStore {
    
    //var name: String { get set }
}

final class ProfitAddressDetailInteractor: ProfitAddressDetailBusinessLogic, ProfitAddressDetailDataStore {
    
    var presenter: ProfitAddressDetailPresentationLogic?
    lazy var worker: ProfitAddressDetailWorkingLogic = ProfitAddressDetailWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: ProfitAddressDetail.Load.Request) {
        let response = ProfitAddressDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
