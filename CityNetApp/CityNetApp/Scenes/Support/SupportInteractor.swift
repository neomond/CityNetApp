//
//  SupportInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol SupportBusinessLogic {
    
    func load(request: Support.Load.Request)
}

protocol SupportDataStore {
    
    //var name: String { get set }
}

final class SupportInteractor: SupportBusinessLogic, SupportDataStore {
    
    var presenter: SupportPresentationLogic?
    lazy var worker: SupportWorkingLogic = SupportWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: Support.Load.Request) {
        let response = Support.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
