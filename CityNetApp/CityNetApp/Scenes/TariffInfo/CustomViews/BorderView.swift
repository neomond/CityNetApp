//
//  BorderView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit

class BorderView: UIView {
    
    var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
