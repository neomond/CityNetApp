//
//  TariffInfoToastView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit
import CityNetUIkit

class TariffInfoToastView: UIView {
    
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = AppAssets.infoIcon.load()
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Yalnız Bakı və Abşeron ərazilərində qoşulmaq mümkündür"
//        lbl.font = AppFonts.SFFootnoteSemibold.fontStyle
        lbl.textColor = adaptiveColor(.black)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
        self.layer.cornerRadius = 12
    }
    
    private func addSubviews() {
        self.stackView.addArrangedSubview(self.imageView)
        self.stackView.addArrangedSubview(self.titleLabel)
        self.addSubview(self.stackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        self.imageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
    }
}
