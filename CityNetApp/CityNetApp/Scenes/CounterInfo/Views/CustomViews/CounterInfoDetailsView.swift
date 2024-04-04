//
//  CounterInfoDetailsView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit
import CityNetUIkit

class CounterInfoDetailsView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    let mockData: [CounterInfoRow] = [
        CounterInfoRow(image: AppAssets.cartSet.load()!, title: "Hər gün 0.30 bonus topla", subtitle: "Qeyd etdiyin əraziyə gələnə qədər hər gün 0.30 bonus topla. *1 bonus = 1 AZN"),
        CounterInfoRow(image: AppAssets.guestSet.load()!, title: "Toplanan bonusları balansına köçür", subtitle: "CityNet ünvanına qoşulduqdan sonra bonuslar dərhal balansında əks olunur."),
        CounterInfoRow(image: AppAssets.moneySet.load()!, title: "Topladığın bonusları xərclə", subtitle: "Topladığın bütün bonusları tarifləri və xidmətləri ödəmək üçün istifadə et.")
    ]
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.shadowOffset =  CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.1
        view.backgroundColor = .white
        return view
    }()
    
    
    let addLabel: UILabel = {
        let label = UILabel()
        label.text = "CityNet-dən yeni təklifi qarşıla!"
        label.font = AppFonts.SFBoldHeadline.fontStyle
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    
    let rulesAndTermsLabel: UILabel = {
        let label = UILabel()
        label.text = "Qaydaları və şərtləri oxu"
        label.font = AppFonts.SFBoldFootnote.fontStyle
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        
        for counterInfoRow in mockData {
            let view = SingleOfferView()
            view.configure(image: counterInfoRow.image, title: counterInfoRow.title, subtitle: counterInfoRow.subtitle)
            self.stackView.addArrangedSubview(view)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        self.addSubview(cardView)
        
        self.cardView.addSubview(addLabel)
        self.cardView.addSubview(stackView)
        self.cardView.addSubview(borderView)
        self.cardView.addSubview(rulesAndTermsLabel)
    }
    
    private func setupUI() { }
    
    
    override func updateConstraints() {
        
        self.cardView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(74)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(357)
        }
        
        self.addLabel.snp.updateConstraints { make in
            make.top.leading.equalTo(cardView).inset(16)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(stackView.snp.top).offset(-8)
            
        }
        self.stackView.snp.updateConstraints { make in
            make.top.equalTo(addLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        self.borderView.snp.updateConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        self.rulesAndTermsLabel.snp.updateConstraints { make in
            make.top.equalTo(borderView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
        
        super.updateConstraints()
    }
    

    
}

