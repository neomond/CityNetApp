//
//  TableViewInfoHeader.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit

class TariffTableViewInfoHeader: UIView {
    
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = adaptiveColor(.black)
        label.textAlignment = .left
        label.text = "Tarif haqqında"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        self.backgroundColor = .white
        
        self.titleLabel.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
