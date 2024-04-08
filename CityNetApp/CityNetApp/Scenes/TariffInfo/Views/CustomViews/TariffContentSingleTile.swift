//
//  File.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

class TariffContentSingleTile: UIStackView {
    
    
    
    var data: TariffInfoType? {
        didSet {
            configure()
        }
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = adaptiveColor(.black)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.black)
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        return lbl
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.spacing = 12
        
        self.addSubviews()
    }
    required init(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        self.addArrangedSubview(self.imageView)
        self.addArrangedSubview(self.titleLabel)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        self.imageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
        super.updateConstraints()
    }
    
    private func configure() {
        guard let data = data else { return }
        
        self.imageView.image = data.image
        self.titleLabel.text = data.title
    }
}
