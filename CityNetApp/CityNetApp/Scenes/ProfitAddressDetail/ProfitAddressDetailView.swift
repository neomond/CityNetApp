//
//  ProfitAddressDetailView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

protocol ProfitAddressDetailViewDelegate: AnyObject {
    func didTapBackButton()
}

final class ProfitAddressDetailView: UIView {
    
    weak var delegate: ProfitAddressDetailViewDelegate?
    
   
    private lazy var customNavBar: ProfitAddressDetailNavBar = {
        let navBar = ProfitAddressDetailNavBar()
        navBar.delegate = self
        return navBar
    }()
    
    
    private let backImageView: UIImageView = {
        let imgView = UIImageView(image: .profitBg)
        return imgView
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = true
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private let walletView: ProfitWalletView = {
        let image = AppAssets.purseImage.load()!
        let view = ProfitWalletView(image: image)
        return view
    }()
    
    private let offersView: ProfitOffersView = {
        let view = ProfitOffersView()
        return view
    }()

    
    lazy var animatingCoinsView =  AnimatingCoinsView(cardWidth: UIScreen.main.bounds.width - 32)
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
        
        self.backImageView.snp.updateConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
        
        self.customNavBar.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.horizontalEdges.equalToSuperview()
        }
        
        self.scrollView.snp.updateConstraints { make in
            make.top.equalTo(self.customNavBar.snp.bottom).offset(64)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.contentView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        self.contentStackView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }

    }

    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.backImageView)
        self.addSubview(self.customNavBar)
    // animation
        self.addSubview(self.animatingCoinsView)
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.contentStackView)
        self.contentStackView.addArrangedSubview(self.walletView)
        self.contentStackView.addArrangedSubview(self.offersView)
        
       
        self.addSubview(self.scrollView)
        self.bringSubviewToFront(scrollView)
       
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}


extension ProfitAddressDetailView: ProfitAddressDetailNavBarDelegate {
    func didTapBackButton() {
        delegate?.didTapBackButton()
    }
}
