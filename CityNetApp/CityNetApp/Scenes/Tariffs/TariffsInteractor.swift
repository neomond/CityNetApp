//
//  TariffsInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol TariffsBusinessLogic {
    
    func load(request: Tariffs.Load.Request)
}

protocol TariffsDataStore {
    
    //var name: String { get set }
}

final class TariffsInteractor: TariffsBusinessLogic, TariffsDataStore {
    
    var presenter: TariffsPresentationLogic?
    lazy var worker: TariffsWorkingLogic = TariffsWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: Tariffs.Load.Request) {
        let response = Tariffs.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
