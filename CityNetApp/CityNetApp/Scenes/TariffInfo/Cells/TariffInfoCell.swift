//
//  TariffInfoCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//


import UIKit
import SnapKit
import CityNetUIkit


 final class TariffInfoCell: UITableViewCell {
    static let identifier = "TariffInfoCell"
    private var toastView: TariffInfoToastView = {
        let view = TariffInfoToastView()
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
        self.contentView.addSubview(self.toastView)
        self.updateConstraints()
    }
    override func updateConstraints() {
        super.updateConstraints()
        
        self.toastView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
