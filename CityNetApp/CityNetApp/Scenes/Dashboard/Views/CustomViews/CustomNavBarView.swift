//
//  CustomNavigationBarView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import SnapKit

class CustomNavBarView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.brandLogo.load()
        return imageView
    }()
    
    let notificationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(AppAssets.notificationIcon.load(), for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImageView, UIView(), notificationButton])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.stackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        self.stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        self.logoImageView.snp.updateConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.notificationButton.snp.updateConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        super.updateConstraints()
    }
    
}
