//
//  TariffInfoInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

protocol TariffInfoBusinessLogic {
    
    func load(request: TariffInfo.Load.Request)
}

protocol TariffInfoDataStore {
    
    //var name: String { get set }
}

final class TariffInfoInteractor: TariffInfoBusinessLogic, TariffInfoDataStore {
    
    var presenter: TariffInfoPresentationLogic?
    lazy var worker: TariffInfoWorkingLogic = TariffInfoWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: TariffInfo.Load.Request) {
        let response = TariffInfo.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
