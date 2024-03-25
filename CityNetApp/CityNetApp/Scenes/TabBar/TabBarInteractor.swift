//
//  TabBarInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

protocol TabBarBusinessLogic {
    
    func load(request: TabBar.Load.Request)
}

protocol TabBarDataStore {
    
    //var name: String { get set }
}

final class TabBarInteractor: TabBarBusinessLogic, TabBarDataStore {
    
    var presenter: TabBarPresentationLogic?
    lazy var worker: TabBarWorkingLogic = TabBarWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: TabBar.Load.Request) {
        let response = TabBar.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
