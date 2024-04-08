//
//  SingleOfferView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit
import CityNetUIkit

class SingleOfferView: UIView {
    
    
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFBoldSubheadline.fontStyle
        label.textColor = adaptiveColor(.black)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFRegularSubheadline.fontStyle
        label.textColor = adaptiveColor(.slate)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var textStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(imageView)
        self.addSubview(textStackView)
    }
    
    override func updateConstraints() {
        self.imageView.snp.updateConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(48) 
        }
        
        self.textStackView.snp.updateConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        super.updateConstraints()
    }
    
    public func configure(image: UIImage?, title: String, subtitle: String) {
        self.imageView.image = image
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
    }
}
