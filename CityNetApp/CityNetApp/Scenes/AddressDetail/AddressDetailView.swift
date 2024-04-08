//
//  AddressDetailView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import Hero
import CityNetUIkit

protocol AddressDetailViewDelegate: AnyObject {
    func dismissVC()
}

final class AddressDetailView: UIView {
    
    weak var delegate: AddressDetailViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.bounces = false
        view.contentInsetAdjustmentBehavior = .never
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
    
    
    private let addressCardView: AddressCardView =  {
        let view = AddressCardView(type: .detail)
        return view
    }()
    
    private let addressActionsView: AddressDetailActionsView = {
        let view = AddressDetailActionsView()
        return view
    }()

    
    private lazy var bottomView: AddressDetailBottomView = {
        let view = AddressDetailBottomView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 71 + 33 - 36))
        view.delegate = self
        return view
    }()

    private lazy var emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.whitePrimary)
        return view
    }()
    
    //MARK: Init
    
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
        
        
        self.scrollView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        self.contentStackView.snp.updateConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(71 + 33 - 36))
        }
        
        self.bottomView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(71 + 33 - 36)
        }

        self.addressCardView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        self.addressActionsView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        self.emptyView.snp.updateConstraints { make in
            make.height.equalTo(96)
        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.contentStackView)
        
        let topBackView = UIView()
    
        topBackView.backgroundColor = .black
        topBackView.hero.id = "addressCard"
        topBackView.addSubview(self.addressCardView)
        
         
        self.contentStackView.addArrangedSubview(topBackView)
        

        let whiteBackView = UIView()
        whiteBackView.backgroundColor = adaptiveColor(.whitePrimary)
        whiteBackView.addSubview(addressActionsView)
        
        self.contentStackView.addArrangedSubview(whiteBackView)
        self.contentStackView.addArrangedSubview(emptyView)
        self.addSubview(self.bottomView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .black
    }
    
    // MARK: - Public
    
    func setAddress(model: AddressModel) {
        self.addressCardView.model =  model
    }
}


extension AddressDetailView: AddressDetailBottomViewDelegate {
    func onBackBtnTap() {
        delegate?.dismissVC()
    }
}

