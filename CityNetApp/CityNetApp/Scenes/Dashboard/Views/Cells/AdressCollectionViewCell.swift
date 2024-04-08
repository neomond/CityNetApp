//
//  AdressCollectionViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit

class AdressCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AdressCollectionViewCell"
    
    var isEmpty = false
    func startAnimation() {
        profitCardView.animatingCoinsView.startAnimating()
        
      isEmpty = profitCardView.animatingCoinsView.subviews.isEmpty
    }

    
    var addressModel: AddressModel? {
        didSet {
            configure()
        }
    }
    
    lazy var profitCardView: AddressProfitCardView = {
        let view = AddressProfitCardView()
        return view
    }()
    
    
    private let actionsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 48
        return view
    }()
    
    
    private lazy var addressCardView: AddressCardView = {
        let view = AddressCardView(type: .basic)
        return view
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.hero.id = "addressCard"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        
        guard let addressModel else { return }
        
        switch addressModel.addressType {
        case .available:
            setupAddressCard()
            
        case .notAvailable:
            setupProfitCard()
        }
        
        self.addressCardView.model = addressModel
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.startAnimation()
    }
    
    
    private func setupAddressCard() {
        self.contentView.addSubview(self.addressCardView)
        
        self.addressCardView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    private func setupProfitCard() {
        self.contentView.addSubview(self.profitCardView)
        
        self.profitCardView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
}
