//
//  AddressStatusView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

class AddressStatusView: UIView {
    
    var status: AddressStatus? {
        didSet {
            configure()
        }
    }
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        view.alignment = .center
        return view
    }()
    
    private lazy var statusView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldFootnote.fontStyle
        lbl.textColor = adaptiveColor(.whitePrimary)
        return lbl
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.backgroundColor = adaptiveColor(.gravel)
        self.layer.cornerRadius = 16
    }
    
    private func addSubviews() {
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.statusView)
        self.stackView.addArrangedSubview(self.titleLabel)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
       
        self.stackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview().inset(8)
        }
        
        self.statusView.snp.updateConstraints { make in
            make.width.height.equalTo(8)
        }
        
        super.updateConstraints()
    }
    
    private func configure() {
        guard let status = status else { return }
        self.statusView.backgroundColor = status.color
        self.titleLabel.text = status.title
    }
}
