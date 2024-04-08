//
//  AddressDetailBottomView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

protocol AddressDetailBottomViewDelegate: AnyObject {
    func onBackBtnTap()
}

class AddressDetailBottomView: UIView {
    
    
    
    weak var delegate: AddressDetailBottomViewDelegate?
    
    
    private lazy var backButton : ArrowDownButton = {
        let btn = ArrowDownButton()
        btn.addTarget(self, action: #selector(onBackBtnTap), for: .touchUpInside)
        return btn
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    private func addSubviews() {
        self.addSubview(self.backButton)
        self.updateConstraints()
    }
    
    
    
    @objc func onBackBtnTap() {
        delegate?.onBackBtnTap()
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let height: CGFloat = 36.0
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = adaptiveColor(.grayPrimary).cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        let screenWidth = UIScreen.main.bounds.width
        let path = UIBezierPath()
        let centerWidth = screenWidth / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough
        
        path.addCurve(to: CGPoint(x: centerWidth, y: -height),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: -height))
        
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: -height), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        
        path.addLine(to: CGPoint(x: screenWidth, y: 0))
        path.addLine(to: CGPoint(x: screenWidth, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        
        backButton.frame = CGRect(x: centerWidth - 28, y: -(frame.height - 8 - 6 - 28), width: 56, height: 56)
        
        addSubviews()
    }
}
