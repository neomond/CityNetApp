//
//  AddressInfoTile.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

typealias AddressInfoTileModel = AddressInfoTile.Model

class AddressInfoTile: UIStackView {
    
    //MARK: AddressInfoModel
    
    struct Model {
        let type: AddressInfoType
        let subtitle: String?
        
        init(type: AddressInfoType, subtitle: String? = nil) {
            self.type = type
            self.subtitle = subtitle
        }
    }
    
    var model: Model? {
        didSet {
            configure()
        }
    }
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFRegularBody.fontStyle
        lbl.textColor = .white.withAlphaComponent(0.5)
        return lbl
    }()
    
    private let subtitleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        
        return view
    }()
    
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        lbl.textColor = .white
        return lbl
    }()

    
    private lazy var copyTextButton: CopyTextButton = {
        let btn = CopyTextButton()
        btn.addTarget(self, action: #selector(onCopyBtnTap), for: .touchUpInside)
        return btn
    }()
    
    
    private let trailingVStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 2
        return view
    }()
    
    private let leadingImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    
    @objc func onCopyBtnTap() {
        guard let text = subtitleLabel.text else { return }
        UIPasteboard.general.string = text
        print("copied \(text)")
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alignment = .center
        self.axis = .horizontal
        self.spacing = 8
        
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        self.addArrangedSubview(self.leadingImageView)
        
        self.trailingVStackView.addArrangedSubview(self.titleLabel)
        self.subtitleStackView.addArrangedSubview(self.subtitleLabel)
        self.trailingVStackView.addArrangedSubview(self.subtitleStackView)
        self.addArrangedSubview(self.trailingVStackView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        self.leadingImageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
        
        super.updateConstraints()
    }
    
    private func configure() {
        
        guard let model = model else { return }
      
        
        self.leadingImageView.image = model.type.icon?.withRenderingMode(.alwaysTemplate)
        self.titleLabel.text = model.type.title
        
        if let subtitle = model.subtitle {
            self.subtitleLabel.text = subtitle
        }

        
        if model.type == .subscriberID {
            self.subtitleStackView.addArrangedSubview(self.copyTextButton)
        }
    }
    
    func setSubtitle(mainText: String, additionalText: String) {
        
        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, NSAttributedString.Key.font:  AppFonts.SFRegularSubheadline.fontStyle]
        
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5), NSAttributedString.Key.font:  AppFonts.SFRegularSubheadline.fontStyle]

        let mainStr = NSMutableAttributedString(string: mainText, attributes: firstAttributes)
        let additionalStr = NSAttributedString(string: additionalText, attributes: secondAttributes)

        mainStr.append(additionalStr)
        
        self.subtitleLabel.attributedText = mainStr
    }
}
