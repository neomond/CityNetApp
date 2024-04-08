//
//  CoinView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 08.04.24.
//

import UIKit

class CoinView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .coin

        return imageView
    }()

    //MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()

        self.imageView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(40)
        }
    }
}
