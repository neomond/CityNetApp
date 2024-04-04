//
//  PurseView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit

class PurseView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.purseImage.load()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var totalEarningsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ümumi qazancın"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var totalEarningsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "4.308641 ₼"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Ünvan"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var addressValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Bakı, Aşıq Alı 40"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var earningsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalEarningsLabel, totalEarningsValueLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var addressStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressLabel, addressValueLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [earningsStackView, addressStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        return stackView
    }()
    
//    MARK: init
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        
//        self.imageView.snp.updateConstraints { make in
//            make.edges.equalToSuperview()
//        }
        self.mainStackView.snp.makeConstraints { make in
            make.centerY.equalTo(imageView.snp.centerY).multipliedBy(1.1)
            make.leading.equalTo(imageView.snp.leading).offset(20)
            make.trailing.equalTo(imageView.snp.trailing).offset(-20)
        }
        
        super.updateConstraints()
    }
    
    private func addSubviews() {
        //self.updateConstraints()
        
        self.addSubview(self.imageView)
        self.addSubview(self.mainStackView)
        
    }
    
    private func setupUI() { }
    
}
