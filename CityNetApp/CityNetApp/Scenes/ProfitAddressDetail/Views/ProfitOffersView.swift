//
//  ProfitOffersView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 07.04.24.
//

import UIKit
import CityNetUIkit

class ProfitOffersView: UIView {

    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "CityNet-dən yeni təklifi qarşıla!"
        lbl.font = AppFonts.SFBoldHeadline.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGray)
        return lbl
    }()
    
    private let offersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        return stackView
    }()
    
    private let bottomSeeMoreView: BottomSeeMoreView = {
        let view = BottomSeeMoreView(title: "Qaydaları və şərtləri oxu")
        return view
    }()
    
   //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.borderColor = adaptiveColor(.graySecondary).cgColor
        self.layer.borderWidth = 1
    }
    
    private func addSubviews() {
        self.addSubview(self.titleLabel)
        
        
        for profitType in ProfitOfferType.allCases {
            let view = SingleProfitOfferView(profitType: profitType)
            self.offersStackView.addArrangedSubview(view)
        }
        
        self.addSubview(self.offersStackView)
        self.addSubview(self.bottomSeeMoreView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.offersStackView.snp.updateConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.bottomSeeMoreView.snp.makeConstraints { make in
            make.top.equalTo(self.offersStackView.snp.bottom).offset(16)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
}
