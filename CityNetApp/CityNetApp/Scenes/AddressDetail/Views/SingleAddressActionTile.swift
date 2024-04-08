//
//  SingleAddressActionTile.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

class SingleAddressActionTile: UIView {
    
    
    
    var actionType: AddressDetailAction? {
        didSet {
            configure()
        }
    }
    
    //MARK: Init
    
    private let leadingImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .black
        return view
    }()
    
    private let titleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 6
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldCallout.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGray)
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldFootnote.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        return lbl
    }()
    
    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .center
        return view
    }()
    
    private lazy var trailingBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(AppAssets.arrow_forward.load(), for: .normal)
        btn.tintColor = adaptiveColor(.slate)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.contentStackView.addArrangedSubview(self.leadingImageView)
        
        self.titleStackView.addArrangedSubview(self.titleLabel)
        self.titleStackView.addArrangedSubview(self.subtitleLabel)
        
        self.contentStackView.addArrangedSubview(self.titleStackView)
        
        self.addSubview(contentStackView)
        self.addSubview(trailingBtn)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentStackView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalToSuperview().inset(12)
            
        }
        
        self.leadingImageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
        
        self.trailingBtn.snp.updateConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(self.contentStackView.snp.trailing).offset(8)
        }
    }
    
    //MARK: - Private
    
    private func configure() {
        
        guard let actionType else { return }
        
        self.leadingImageView.image = actionType.image
        self.titleLabel.text = actionType.title
        self.subtitleLabel.text = actionType.subtitle
    }
}
