//
//  CardView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 02.04.24.
//

import UIKit
import CityNetUIkit

class CardView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let addButtonContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 28
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        return view
    }()
    
    let addLabel: UILabel = {
        let label = UILabel()
        label.text = "Ünvan əlavə et"
        label.font = AppFonts.SFBoldFootnote.fontStyle
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let dashedBorderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.gray.cgColor
        layer.lineDashPattern = [5, 3]
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        self.addSubview(cardView)
        self.cardView.addSubview(addButtonContainerView)
        self.addButtonContainerView.addSubview(addButton)
        self.cardView.addSubview(addLabel)
    }
    
    private func setupUI() {
        self.cardView.layer.addSublayer(dashedBorderLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dashedBorderLayer.frame = cardView.bounds
        dashedBorderLayer.path = UIBezierPath(roundedRect: cardView.bounds, cornerRadius: 16).cgPath
    }
    
    override func updateConstraints() {
        
        self.cardView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(288)
            make.width.equalTo(263)
        }
        
        self.addButtonContainerView.snp.updateConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-16)
            make.height.width.equalTo(56)
        }
        
        self.addButton.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.addLabel.snp.updateConstraints { make in
            make.top.equalTo(addButtonContainerView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}

