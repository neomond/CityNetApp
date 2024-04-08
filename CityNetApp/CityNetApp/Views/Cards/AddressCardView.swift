//
//  AddressCardView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit


typealias AddressCardViewType = AddressCardView.CardType

class AddressCardView: UIView {
    
    enum CardType {
        case basic
        case detail
    }
    
    var model: AddressModel? {
        didSet {
            configure()
        }
    }
    
    private let cardType: CardType
    
    private lazy var addressTile = createInfoTile()
    private lazy var tariffTile = createInfoTile()
    private lazy var renewalDateTile = createInfoTile()
    private lazy var monthlyPaymentTile = createInfoTile()
    private lazy var balanceTile = createInfoTile()
    private lazy var subsciptionsTile = createInfoTile()
    private lazy var additionsTile = createInfoTile()
    private lazy var subscriberIDTile = createInfoTile()
    
    
    private let statusView: AddressStatusView = {
        let view = AddressStatusView()
        return view
    }()
    
    private let cardStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 24
        return view
    }()
    
    private func createInfoTile() -> AddressInfoTile {
        let tile = AddressInfoTile()
        return tile
    }
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var seeMoreButton: AppLighterButton = {
        let btn = AppLighterButton()
        btn.setTitle("Ünvan detallarına bax", for: .normal)
        btn.setImage(AppAssets.arrow_forward.load(), for: .normal)
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    //MARK: Init
    
    init(type: CardType) {
        self.cardType = type
        super.init(frame: .zero)
        
        self.setupView()
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.backgroundColor = adaptiveColor(.cardBg)
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        self.layer.borderWidth = 1
    }
    
    private func addSubviews() {
        
        self.addSubview(self.statusView)
        self.addSubview(self.cardStackView)
        
        self.cardStackView.addArrangedSubview(self.addressTile)
        self.cardStackView.addArrangedSubview(self.tariffTile)
        self.cardStackView.addArrangedSubview(self.renewalDateTile)
        
        self.bottomStackView.addArrangedSubview(self.monthlyPaymentTile)
        self.bottomStackView.addArrangedSubview(self.balanceTile)
        
        self.cardStackView.addArrangedSubview(self.bottomStackView)
        
        
        switch self.cardType {
        case .basic:
            self.cardStackView.addArrangedSubview(self.seeMoreButton)
        case .detail:
            self.cardStackView.addArrangedSubview(DashedLineView())
            self.cardStackView.addArrangedSubview(self.subsciptionsTile)
            self.cardStackView.addArrangedSubview(self.additionsTile)
            self.cardStackView.addArrangedSubview(self.subscriberIDTile)
        }
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.statusView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(24)
        }
        
        self.cardStackView.snp.updateConstraints { make in
            make.top.equalTo(self.statusView.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func configure() {
        guard let model = model else { return }
        self.statusView.status = model.status
        self.addressTile.model = .init(type: .address, subtitle: model.address)
        self.tariffTile.model = .init(type: .tariff, subtitle: model.tariffName)
        self.renewalDateTile.model = .init(type: .renewalDate, subtitle: model.renewalDate)
        self.monthlyPaymentTile.model = .init(type: .monthlyPayment, subtitle: model.monthlyPayment.createPrice())
        self.balanceTile.model = .init(type: .balance, subtitle: model.balance.createPrice())
        
        
        if self.cardType == .detail {
            self.subsciptionsTile.model = .init(type: .subscriptions, subtitle: model.subscriptions)
            
            self.additionsTile.model = .init(type: .additions)
            self.additionsTile.setSubtitle(mainText: model.additions.joined(separator: ", "), additionalText: " (\(model.additions.count) ədəd)")
            
            
            self.subscriberIDTile.model = .init(type: .subscriberID, subtitle: model.subscriberID)
        }
    }
}
