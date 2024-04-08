//
//  ProfitWalletView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 07.04.24.
//

import UIKit
import CityNetUIkit

class ProfitWalletView: UIView {
    
    let image: UIImage

    
    private lazy var walletImage: UIImageView = {
        let view = UIImageView(image: image)
        return view
    }()

    private let contentView : ProfitWalletContentView = {
        let view = ProfitWalletContentView()
        return view
    }()
    

    
    //MARK: Init
    
    init(image: UIImage) {
        self.image = image
        super.init(frame: .zero)

        self.addSubviews()
        
       
    
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.walletImage)
        self.walletImage.addSubview(self.contentView)
        
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.walletImage.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.height.equalTo(220)
        }
        
        self.contentView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(32)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
    }
}


