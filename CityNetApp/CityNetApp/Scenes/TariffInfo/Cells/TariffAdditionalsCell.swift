//
//  TariffAdditionals.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 29.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit


internal final class TariffAdditionalsCell: UITableViewCell, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    static let identifier = "TariffAdditionalsCell"
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = adaptiveColor(.graySecondary).cgColor
        return view
    }()
    
    
    private lazy var additionalServicesHeaderView: AdditionalServicesHeaderView = {
        let view = AdditionalServicesHeaderView()
        return view
    }()
    
    private lazy var serviceOptionView: ServiceOptionView = {
        let view = ServiceOptionView()
        return view
    }()
    
        
    private lazy var servicePlusOptionView: ServicePlusOptionView = {
        let view = ServicePlusOptionView()
        return view
    }()
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(additionalServicesHeaderView)
        self.contentView.addSubview(cardView)
        
        self.cardView.addSubview(servicePlusOptionView)
        self.cardView.addSubview(serviceOptionView)
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.cardView.snp.updateConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-32)
        }
        self.servicePlusOptionView.snp.updateConstraints { make in
            make.top.equalTo(cardView.snp.top)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(serviceOptionView.snp.top).inset(16)
        }
        
        self.additionalServicesHeaderView.snp.updateConstraints { make in
            make.bottom.equalTo(cardView.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(16)
        }
        
        self.serviceOptionView.snp.updateConstraints { make in
            make.top.equalTo(servicePlusOptionView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}
