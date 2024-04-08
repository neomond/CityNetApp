//
//  ProfitAddressDetailNavBar.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 07.04.24.
//

import UIKit

protocol ProfitAddressDetailNavBarDelegate: AnyObject {
    func didTapBackButton()
}


class ProfitAddressDetailNavBar: UIView {
    
    
    weak var delegate: ProfitAddressDetailNavBarDelegate?
    
    
    //MARK: Init
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 0
        view.distribution = .equalSpacing
        return view
    }()
    
    private lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(AppAssets.backIcon.load(), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(onBackBtnTap), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var moreBtn:  UIButton = {
        let btn = UIButton()
        btn.setImage(AppAssets.settingsIcon.load(), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(onMoreBtnTap), for: .touchUpInside)
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
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.backBtn)
        self.stackView.addArrangedSubview(self.moreBtn)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.stackView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(8)
        }
        
        self.backBtn.snp.updateConstraints { make in
            make.width.height.equalTo(48)
        }
        
        self.moreBtn.snp.updateConstraints { make in
            make.width.height.equalTo(48)
        }
    }
    
    @objc func onBackBtnTap() {
        delegate?.didTapBackButton()
    }
    
    @objc func onMoreBtnTap() {
//        delegate?.onBackBtnTap()
    }
    
    
}
