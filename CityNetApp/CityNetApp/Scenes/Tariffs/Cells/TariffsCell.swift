//
//  TariffsCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit

class TariffsCell: UITableViewCell, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    static let identifier = "TariffsCell"
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var cardViewHeader: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: AppAssets.speedImage40.rawValue)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = adaptiveColor(.grayPrimary)
        self.addSubviews()
        
    }
    
    lazy var featureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        return stackView
    }()
    
    
    lazy var fiberOptikFeatureView: FeatureView = {
        FeatureView(featureIconName: AppAssets.fiberOptikIcon.rawValue, featureText: "Fiber optik")
    }()
    
    lazy var speedFeatureView: FeatureView = {
        FeatureView(featureIconName: AppAssets.speedIcon.rawValue, featureText: "40 Mb/s sürət")
    }()
    
    lazy var wifiFeatureView: FeatureView = {
        FeatureView(featureIconName: AppAssets.wifiIcon.rawValue, featureText: "Wi-Fi ruter (PULSUZ)")
    }()
    
    
    lazy var subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = adaptiveColor(.main)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 12
        return button
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        self.contentView.addSubview(cardView)
        self.cardView.addSubview(cardViewHeader)
        self.cardViewHeader.addSubview(titleLabel)
        self.cardView.addSubview(iconImageView)
        self.cardView.addSubview(featureStackView)
        
        
        self.featureStackView.addArrangedSubview(fiberOptikFeatureView)
        self.featureStackView.addArrangedSubview(speedFeatureView)
        self.featureStackView.addArrangedSubview(wifiFeatureView)
        self.featureStackView.addArrangedSubview(subscribeButton)
        
        self.updateConstraints()
    }
    
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.cardView.snp.updateConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-32)
        }
        self.cardViewHeader.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.horizontalEdges.equalToSuperview().inset(2)
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.iconImageView.snp.updateConstraints { make in
            make.width.height.equalTo(88)
            make.top.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-12)
        }
        self.featureStackView.snp.updateConstraints { make in
            make.top.equalTo(cardViewHeader.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-8)
        }
        self.subscribeButton.snp.remakeConstraints { make in
            make.bottom.equalTo(cardView.snp.bottom).offset(-16)
            make.leading.trailing.equalTo(cardView).inset(16)
            make.height.equalTo(56)
        }
    }
    
    
    
    func configure(with tariff: Tariff) {
        titleLabel.text = tariff.title
        speedFeatureView.titleLabel.text = tariff.speedText
        subscribeButton.setTitle(tariff.priceText, for: .normal)
        iconImageView.image = tariff.speedImage
        
        switch tariff.type {
        case .internet:
            cardViewHeader.backgroundColor = adaptiveColor(.paleBlue)
            
        case .internetTV:
            cardViewHeader.backgroundColor = adaptiveColor(.paleYellow)
            
        case .internetTVPhone:
            cardViewHeader.backgroundColor = adaptiveColor(.paleCarmine)
        }
    }
    
}


// MARK: remakeConstraints --------------
// This method clears all existing constraints on the subscribeButton and sets up new ones based on the block you provide. It's useful when you need to completely change the layout of a view, as it ensures no old constraints are left that could conflict with the new setup.
