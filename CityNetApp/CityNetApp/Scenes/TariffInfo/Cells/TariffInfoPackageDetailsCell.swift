//
//  TariffInfoPackageDetails.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit

class TariffInfoPackageDetailsCell: UITableViewCell, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    static let identifier = "TariffInfoPackageDetailsCell"
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        return view
    }()
    
    lazy var cardViewHeader: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = adaptiveColor(.paleCarmine)
        return view
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "İnternet + TV + Telefon xətti"
        label.textColor = .black
        return label
    }()
    
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: AppAssets.speedImage100.rawValue)
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
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
    
    
    lazy var tvFeatureView: FeatureView = {
        FeatureView(featureIconName: AppAssets.wifiIcon.rawValue, featureText: "Wi-Fi ruter (PULSUZ)")
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
        self.featureStackView.addArrangedSubview(tvFeatureView)
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
    }
    
}

