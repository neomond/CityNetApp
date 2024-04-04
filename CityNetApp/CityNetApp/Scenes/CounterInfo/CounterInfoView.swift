//
//  CounterInfoView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 04.04.24.
//

import UIKit
import CityNetUIkit

protocol CounterInfoViewDelegate: AnyObject { }

final class CounterInfoView: UIView, ThemeableView {
    
    weak var delegate: CounterInfoViewDelegate?
    
    var theme: ThemeProvider = App.theme
    
    lazy var customNavBarView: CustomBackBtnView = {
        let view = CustomBackBtnView()
        return view
    }()
    
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: AppAssets.bgMain.load())
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    // MARK: purse UI
    lazy var purseContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    
    lazy var purseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.purseImage.load()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    lazy var totalEarningsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ümumi qazancın"
        label.textColor = adaptiveColor(.grayTertiary)
        label.font = AppFonts.SFRegularSubheadline.fontStyle
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var totalEarningsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "4.308641 ₼"
        label.textColor = adaptiveColor(.greenDark)
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Ünvan"
        label.textColor = adaptiveColor(.grayTertiary)
        label.font = AppFonts.SFRegularSubheadline.fontStyle
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var addressValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Bakı, Aşıq Alı 40"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
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
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 62
        return stackView
    }()
    
    // MARK: purse UI ends
    
    
    lazy var counterCardDetailsView: CounterInfoDetailsView = {
        let view = CounterInfoDetailsView()
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        self.customNavBarView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        self.counterCardDetailsView.snp.updateConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
        }
        
        self.backgroundImageView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(counterCardDetailsView.snp.top).offset(-8)
        }
        
        self.purseContainerView.snp.updateConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backgroundImageView.snp.centerY).offset(126)
            make.width.equalTo(backgroundImageView.snp.width).multipliedBy(0.98)
            make.height.equalTo(purseContainerView.snp.width)
        }
        
        self.purseImageView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.mainStackView.snp.updateConstraints { make in
            make.top.equalTo(purseImageView.snp.top).offset(78)
            make.leading.equalTo(purseImageView.snp.leading).offset(36)
        }
        
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
        
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.customNavBarView)
        self.addSubview(self.purseContainerView)
        self.purseContainerView.addSubview(self.purseImageView)
        self.purseImageView.addSubview(self.mainStackView)
        
        self.addSubview(self.counterCardDetailsView)
        self.sendSubviewToBack(self.backgroundImageView)
        
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
