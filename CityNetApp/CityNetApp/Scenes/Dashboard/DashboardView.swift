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
    
    
    lazy var customNavBarView: CustomNavBarView = {
        let view = CustomNavBarView()
        return view
    }()
    
    
    
    lazy var cardView: CardView = {
        let view = CardView()
        return view
    }()
    
    
    lazy var speedIndicatorCardView: SpeedIndicatorCardView = {
        let view = SpeedIndicatorCardView()
        return view
    }()
  
    
    // MARK: init
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
        self.cardView.snp.updateConstraints { make in
            make.top.equalTo(customNavBarView.snp.bottom).offset(24)
            make.leading.equalTo(customNavBarView).offset(28)
            make.trailing.equalTo(customNavBarView).offset(-28)
           
        }
        self.speedIndicatorCardView.snp.updateConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(28)
        }
        
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.customNavBarView)
        self.addSubview(self.cardView)
        self.addSubview(self.speedIndicatorCardView)
       
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.black)
    }
}
