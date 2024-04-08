//
//  AppLighterButton.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

class AppLighterButton: UIButton {
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 8
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = AppFonts.SFRegularCaption1.fontStyle
       
        self.semanticContentAttribute = .forceRightToLeft
        
        self.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
