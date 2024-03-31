//
//  TariffInfoTableView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

class TariffInfoTableView: UITableView {
    
    //MARK: Init
    
    init(){
        super.init(frame: .zero, style: .plain)
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.allowsSelection = false
        self.showsVerticalScrollIndicator = false
        self.register(TariffInfoCell.self, forCellReuseIdentifier: TariffInfoCell.identifier)
        self.register(TariffInfoPackageDetailsCell.self, forCellReuseIdentifier: TariffInfoPackageDetailsCell.identifier)
        self.register(TariffAdditionalsCell.self, forCellReuseIdentifier: TariffAdditionalsCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
