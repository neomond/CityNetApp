//
//  NoOperationsTableViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 03.04.24.
//

import UIKit
import CityNetUIkit

class NoOperationsTableViewCell: UITableViewCell {
    static let identifier = "NoOperationsTableViewCell"
    
    
    
    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private let noOperationsIv: UIImageView = {
        let view = UIImageView(image: AppAssets.addFile.load())
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Əməliyyat olmayıb"
        lbl.font = AppFonts.SFBoldTitle2.fontStyle
        lbl.textColor = adaptiveColor(.charcoalGray)
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tarif seçərək əməliyyatlara başlaya bilərsən."
        lbl.font = AppFonts.SFBoldFootnote.fontStyle
        lbl.textColor = adaptiveColor(.grayTertiary)
        return lbl
    }()
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupCell(with: .white)
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        self.contentStackView.addArrangedSubview(self.noOperationsIv)
        self.contentStackView.setCustomSpacing(24, after: self.noOperationsIv)
        self.contentStackView.addArrangedSubview(self.titleLabel)
        self.contentStackView.setCustomSpacing(8, after: self.titleLabel)
        self.contentStackView.addArrangedSubview(self.subtitleLabel)
        self.contentView.addSubview(self.contentStackView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentStackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(80)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        self.noOperationsIv.snp.updateConstraints { make in
            make.width.height.equalTo(80)
        }
    }
}
