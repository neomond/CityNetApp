//
//  SpeedCardsTableViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 03.04.24.
//

import UIKit

class SpeedCardsTableViewCell: UITableViewCell {
    static let identifier = "SpeedCardsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var speedIndicatorCardView: SpeedIndicatorCardView = {
        let view = SpeedIndicatorCardView()
        return view
    }()
    
    override func updateConstraints() {
        
        self.speedIndicatorCardView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.trailing.equalToSuperview().inset(28)
        }
        
        super.updateConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.speedIndicatorCardView)
        
        self.updateConstraints()
    }
    
    
    
}
