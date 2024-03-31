//
//  ServiceOptionView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 29.03.24.
//

import UIKit
import SnapKit

class ServiceOptionView: UIView {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.tvboxIcon.load()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Əlavə TV Box cihazı"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "5 ₼ / Aylıq"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Əlavə TV Box cihazı alaraq, birdən çox televizora paylaya bilərsən."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var customStepper: CustomStepper = {
        let stepper = CustomStepper()
        stepper.snp.updateConstraints { make in
            make.height.equalTo(40)
        }
        return stepper
    }()
    
    
    private lazy var titleIconStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    
    private lazy var iconTitlePriceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleIconStackView, UIView(), priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconTitlePriceStackView, descriptionLabel, customStepper])
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(mainStackView)
        
        self.mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.iconTitlePriceStackView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(24)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(80)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            
        }
    }
}
