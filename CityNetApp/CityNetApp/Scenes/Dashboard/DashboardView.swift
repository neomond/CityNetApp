//
//  DashboardView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit
import CityNetUIkit

protocol DashboardViewDelegate: AnyObject {}

final class DashboardView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    weak var delegate: DashboardViewDelegate?
    
    let customNavBarView = CustomNavBarView()
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.customNavBarView.snp.updateConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.customNavBarView)
        
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.black)
    }
}
