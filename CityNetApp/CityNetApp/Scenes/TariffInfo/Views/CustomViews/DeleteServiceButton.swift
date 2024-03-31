//
//  File.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

class DeleteServiceButton: UIButton, ThemeableView {

    var theme: ThemeProvider = App.theme
    
   //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = adaptiveColor(.main).cgColor
        
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
//        
        self.setTitle("Əlavəni sil", for: .normal)
        self.titleLabel?.font = AppFonts.SFBoldCallout.fontStyle
        self.setTitleColor(adaptiveColor(.main), for: .normal)   
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
