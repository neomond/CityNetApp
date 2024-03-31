//
//  AppDivider.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

class AppDivider: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDivider()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupDivider() {
        self.backgroundColor = adaptiveColor(.graySecondary)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.snp.updateConstraints { make in
            make.height.equalTo(1)
        }
    }
}
