//
//  DashboardView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

protocol DashboardViewDelegate: AnyObject {
    
}

final class DashboardView: UIView {
    
    weak var delegate: DashboardViewDelegate?
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
