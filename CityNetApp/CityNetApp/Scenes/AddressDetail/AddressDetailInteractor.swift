//
//  AddressDetailInteractor.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol AddressDetailBusinessLogic {
    
    func load(request: AddressDetail.Load.Request)
}

protocol AddressDetailDataStore {
    
    var addressModel: AddressModel? { get set }
}

final class AddressDetailInteractor: AddressDetailBusinessLogic, AddressDetailDataStore {
    var addressModel: AddressModel?
    
    var presenter: AddressDetailPresentationLogic?
    lazy var worker: AddressDetailWorkingLogic = AddressDetailWorker()
    //var name: String = ""
  
    
    // MARK: Business Logic
  
    func load(request: AddressDetail.Load.Request) {
        let response = AddressDetail.Load.Response()
        presenter?.presentLoad(response: response)
    }
}
