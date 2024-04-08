//
//  BottomSeeMoreView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 07.04.24.
//

import UIKit
import CityNetUIkit

class BottomSeeMoreView: UIView {
    
    let title: String
    
    private let divider: AppDivider = {
        let view = AppDivider()
        view.backgroundColor = .black.withAlphaComponent(0.06)
        return view
    }()
    
    private lazy var seeMoreLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = title
        lbl.font = AppFonts.SFBoldFootnote.fontStyle
        lbl.textColor = adaptiveColor(.slate)
        lbl.numberOfLines = 1
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    
    private lazy var seeMoreImage: UIImageView = {
        let imgView = UIImageView(image: .arrowForward)
        imgView.tintColor = adaptiveColor(.slate)
        return imgView
    }()
    
    private lazy var seeMoreView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 2
        view.alignment = .center
        
        return view
    }()
    
    //MARK: Init
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        
        self.addSubview(self.divider)
        self.seeMoreView.addArrangedSubview(self.seeMoreLbl)
        self.seeMoreView.addArrangedSubview(self.seeMoreImage)
        self.addSubview(self.seeMoreView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
        
        self.seeMoreView.snp.updateConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.divider.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        
        self.seeMoreImage.snp.updateConstraints { make in
            make.width.height.equalTo(24)
        }
    }
}
