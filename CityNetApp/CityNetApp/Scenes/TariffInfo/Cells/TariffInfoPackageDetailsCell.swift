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
        view.layer.borderWidth = 1
        view.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 10
        
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
        stackView.spacing = 24
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
        FeatureView(featureIconName: AppAssets.tvboxIcon.rawValue, featureText: "TV Box")
    }()
    
    lazy var channelFeatureView: FeatureView = {
        FeatureView(featureIconName: AppAssets.channelIcon.rawValue, featureText: "240 kanal")
    }()
    
    lazy var homePhoneFeatureView: FeatureView = {
        FeatureView(featureIconName: AppAssets.cellPhoneIcon.rawValue, featureText: "Ev telefonu xətti")
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
        self.featureStackView.addArrangedSubview(channelFeatureView)
        self.featureStackView.addArrangedSubview(homePhoneFeatureView)
        
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
            make.top.equalTo(cardViewHeader.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
}

