//
//  TariffsTableView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//


import UIKit

class TariffsTableView: UITableView {
    
    //MARK: Init
    
    init(){
        super.init(frame: .zero, style: .plain)
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.allowsSelection = false
        self.showsVerticalScrollIndicator = false
        self.register(TariffsCell.self, forCellReuseIdentifier: TariffsCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
