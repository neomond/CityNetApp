//
//  ProfitWalletContentView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 07.04.24.
//

import UIKit
import CityNetUIkit


class ProfitWalletContentView: UIStackView {
    
    private lazy var topHStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [totalProfitTitleLabel, totalProfitAmountLabel])
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private lazy var bottomHStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [addressHeaderLabel, addressLabel])
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    
    private lazy var totalProfitTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ümumi qazancın"
        lbl.font = AppFonts.SFBoldCaption1.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        return lbl
    }()
    
    private lazy var totalProfitAmountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "4.308641 ₼"
        lbl.font = AppFonts.SFBoldTitle2.fontStyle.withSize(18)
        lbl.textColor = adaptiveColor(.greenDark)
        return lbl
    }()
    
    private lazy var addressHeaderLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ünvan"
        lbl.font = AppFonts.SFBoldCaption1.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        return lbl
    }()
    
    private lazy var addressLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Bakı, Aşıq Alı 40"
        lbl.font = AppFonts.SFBoldFootnote.fontStyle
        lbl.textColor = adaptiveColor(.grayTertiary)
        return lbl
    }()

    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        
        self.topHStackView.addArrangedSubview(self.totalProfitTitleLabel)
        self.topHStackView.addArrangedSubview(self.totalProfitAmountLabel)
        self.addSubview(self.topHStackView)
        
        self.bottomHStackView.addArrangedSubview(self.addressHeaderLabel)
        self.bottomHStackView.addArrangedSubview(self.addressLabel)
        
        self.addSubview(self.bottomHStackView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.topHStackView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }

        self.bottomHStackView.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.horizontalEdges.equalToSuperview()
        }
    }
}
