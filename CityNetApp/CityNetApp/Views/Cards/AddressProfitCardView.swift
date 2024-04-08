//
//  AddressProfitCardView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

class AddressProfitCardView: UIView {
    
    private let backImageView: UIImageView = {
        let imgView = UIImageView(image: .bgMain)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 16
        imgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return imgView
    }()
    
    private lazy var walletView: ProfitWalletView = {
        let view = ProfitWalletView(image: AppAssets.purseImage.load()!)
        return view
        
    }()
    
    private let bottomSeeMoreView: BottomSeeMoreView = {
        let view = BottomSeeMoreView(title: "Ətraflı bax")
        return view
    }()
    
    lazy var animatingCoinsView =  AnimatingCoinsView(cardWidth: cardWidth)
    
    lazy var cardWidth = UIScreen.main.bounds.width - 32

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
        self.layer.borderWidth = 1
        self.layer.borderColor = adaptiveColor(.graySecondary).cgColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
    }
    
    private func addSubviews() {
        self.addSubview(self.backImageView)
        self.addSubview(self.bottomSeeMoreView)
        self.addSubview(animatingCoinsView)
        self.addSubview(self.walletView)
     
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backImageView.snp.updateConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.bottomSeeMoreView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        
        self.walletView.snp.updateConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
