//
//  CopyCodeButton.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

class CopyTextButton: UIButton {

    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupButton()
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupButton() {
        self.tintColor = .white.withAlphaComponent(0.5)
        self.setImage(AppAssets.copy.load(), for: .normal)
    }
}
