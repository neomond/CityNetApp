//
//  CounterInfoInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

protocol CounterInfoBusinessLogic {
    
    func load(request: CounterInfo.Load.Request)
}

protocol CounterInfoDataStore {
    
    //var name: String { get set }
}

final class CounterInfoInteractor: CounterInfoBusinessLogic, CounterInfoDataStore {
    
    var presenter: CounterInfoPresentationLogic?
    lazy var worker: CounterInfoWorkingLogic = CounterInfoWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: CounterInfo.Load.Request) {
        let response = CounterInfo.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
