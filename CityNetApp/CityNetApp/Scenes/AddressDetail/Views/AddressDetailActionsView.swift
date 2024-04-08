//
//  AddressDetailActionsView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

class AddressDetailActionsView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ünvanı idarə et"
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        return lbl
    }()
    
    private let actionsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let actionsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
   //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(actionsView)
        self.actionsView.addSubview(actionsStackView)
        
        
        for (index, action) in AddressDetailAction.allCases.enumerated() {
            let view = SingleAddressActionTile()
            view.actionType = action
            self.actionsStackView.addArrangedSubview(view)
            
            
            if index < AddressDetailAction.allCases.count - 1 {
                let divider = AppDivider()
                divider.backgroundColor = .black.withAlphaComponent(0.06)
                self.actionsStackView.addArrangedSubview(divider)
            }
        }
      
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(8)
        }
        
        self.actionsView.snp.updateConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(12)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.actionsStackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
