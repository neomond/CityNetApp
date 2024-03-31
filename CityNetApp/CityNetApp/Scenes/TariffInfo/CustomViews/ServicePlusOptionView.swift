//
//  ServicePlusOptionView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 29.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit

class ServicePlusOptionView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.ipIcon.load()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Statik IP"
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
        label.text = "Müşahidə kameraları, şəbəkə oyunları, fayl mübadiləsi və bir çox yöndə istifadə edilir."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Əlavəni sil", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        return button
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
        let stackView = UIStackView(arrangedSubviews: [iconTitlePriceStackView, descriptionLabel, deleteButton, borderView])
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var borderView: BorderView = {
        let view = BorderView()
        view.borderColor = adaptiveColor(.grayPrimary)
        view.borderWidth = 1.0
        return view
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
        
        self.deleteButton.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(80)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            
        }
        
        self.borderView.snp.makeConstraints { make in
            make.top.equalTo(deleteButton.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.0)
       }
    }
}
