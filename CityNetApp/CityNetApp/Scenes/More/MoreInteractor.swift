//
//  MoreInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit

protocol MoreBusinessLogic {
    
    func load(request: More.Load.Request)
}

protocol MoreDataStore {
    
    //var name: String { get set }
}

final class MoreInteractor: MoreBusinessLogic, MoreDataStore {
    
    var presenter: MorePresentationLogic?
    lazy var worker: MoreWorkingLogic = MoreWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: More.Load.Request) {
        let response = More.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
