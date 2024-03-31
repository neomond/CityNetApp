//
//  file.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

class AppPrimaryButton: UIButton, ThemeableView {
        
    var theme: ThemeProvider = App.theme
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupButton() {
        self.backgroundColor = adaptiveColor(.main)
        self.tintColor = .white
        self.layer.cornerRadius = 12
        self.titleLabel?.font = AppFonts.SFBoldCallout.fontStyle

    }
}
