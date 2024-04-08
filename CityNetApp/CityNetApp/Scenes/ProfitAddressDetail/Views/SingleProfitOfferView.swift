//
//  SingleProfitOfferView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 07.04.24.
//

import UIKit
import CityNetUIkit

class SingleProfitOfferView: UIStackView {
    
    let profitType: ProfitOfferType
    
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = profitType.image
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = profitType.title
        lbl.font = AppFonts.SFBoldSubheadline.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGray)
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = profitType.subtitle
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()
    
    //MARK: Init
    
    init(profitType: ProfitOfferType) {
        self.profitType = profitType
        super.init(frame: .zero)
        self.setupView()
        self.addSubviews()
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.axis = .horizontal
        self.alignment = .center
        self.spacing = 12
    }
    
    
    private func addSubviews() {
        
        self.addArrangedSubview(self.leftImageView)
        self.rightStackView.addArrangedSubview(self.titleLabel)
        self.rightStackView.addArrangedSubview(self.subtitleLabel)
        self.addArrangedSubview(self.rightStackView)
        
        self.updateConstraints()
        
    }
    
    override func updateConstraints() {
        
        self.leftImageView.snp.updateConstraints { make in
            make.width.height.equalTo(48)
        }
        
        super.updateConstraints()
    }
}
