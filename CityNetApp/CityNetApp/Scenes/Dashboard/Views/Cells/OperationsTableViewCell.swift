//
//  OperationsTableViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 03.04.24.
//

import UIKit
import CityNetUIkit

class OperationsTableViewCell: UITableViewCell {
    
    static let identifier = "OperationsTableViewCell"
    
    
    //MARK: init
    
    var model: TransactionModel?  {
        didSet {
            configure()
        }
    }
    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 16
        return view
        
    }()
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = adaptiveColor(.graySecondary).cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let imgView = UIImageView()
        imgView.tintColor = adaptiveColor(.charcoalGray)
        return imgView
    }()
    
    private let dataStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .equalSpacing
        return view
    }()
    
    private let leadingStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    private let trailingStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .trailing
        view.spacing = 4
        return view
    }()
    
    private lazy var titleLabel = createTitleLabel()
    
    private lazy var subtitleLabel = createSubtitleLabel()
    
    private lazy var priceLabel = createTitleLabel()
    
    private lazy var dateLabel = createSubtitleLabel()
    
    private func createTitleLabel() -> UILabel {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.charcoalGray)
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
       return lbl
   }
    
    private func createSubtitleLabel() -> UILabel {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.grayTertiary)
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        return lbl
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell(with: .white)
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func addSubviews() {
        self.iconView.addSubview(self.iconImage)
        
        self.contentStackView.addArrangedSubview(self.iconView)
        self.contentStackView.addArrangedSubview(self.dataStackView)
        
        self.dataStackView.addArrangedSubview(self.leadingStackView)
        
        self.leadingStackView.addArrangedSubview(self.titleLabel)
        self.leadingStackView.addArrangedSubview(self.subtitleLabel)
        
        
        self.dataStackView.addArrangedSubview(self.trailingStackView)
        
        self.trailingStackView.addArrangedSubview(self.priceLabel)
        self.trailingStackView.addArrangedSubview(self.dateLabel)
        
        self.contentView.addSubview(self.contentStackView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    
        self.contentStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        self.iconView.snp.updateConstraints { make in
            make.width.height.equalTo(40)
        }
        
        self.iconImage.snp.updateConstraints { make in
            make.width.height.equalTo(24)
            make.center.equalToSuperview()
        }
    }
    
    private func configure() {
        guard let model = model else { return }
        
        self.titleLabel.text = model.title
        self.iconImage.image = model.type.iconImage
        
        self.subtitleLabel.text = model.type.title
        
        self.priceLabel.text = "\(model.amount) ₼"
        self.priceLabel.textColor = adaptiveColor(model.type.amountColor)
        self.dateLabel.text = model.date
    }
}

