//
//  ExtraServiceSingleView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

@objc protocol ExtraServiceSingleViewDelegate: AnyObject {
    @objc optional func onDeleteBtnTap()
    
    @objc optional func sendStepperValue(_ value: Double)
    
}

class ExtraServiceSingleView: UIView, ThemeableView {
    
    var model: ServiceOptionType? {
        didSet {
            configure()
        }
    }
    
    var theme: ThemeProvider = App.theme
    weak var delegate: ExtraServiceSingleViewDelegate?
    
    //MARK: Init
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = adaptiveColor(.black)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    private lazy var titleStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 12
        view.axis = .horizontal
        view.alignment = .fill
        return view
    }()
    
    private lazy var titleInnerStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 0
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.black)
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        return lbl
    }()
    
    private lazy var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = adaptiveColor(.black)
        lbl.font = AppFonts.SFBoldSubheadline.fontStyle
        return lbl
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFRegularSubheadline.fontStyle
        lbl.textColor = adaptiveColor(.black)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private lazy var deleteBtn: DeleteServiceButton = {
        let btn = DeleteServiceButton()
        btn.addTarget(self, action: #selector(onDeleteBtnTap), for: .touchUpInside)
        return btn
    }()
    
    
    private lazy var customStepper: AppStepper = {
        let stepper = AppStepper(viewData: .init(minimum: 0, maximum: 10, stepValue: 1))
        
        stepper.addTarget(self, action: #selector(didStepperValueChanged), for: .valueChanged)
        return stepper
    }()
    
    @objc private func didStepperValueChanged() {
        delegate?.sendStepperValue?(customStepper.value)
    }
    
    @objc private func onDeleteBtnTap() {
        delegate?.onDeleteBtnTap?()
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        
        self.titleStackView.addArrangedSubview(self.imageView)
        
        self.titleInnerStackView.addArrangedSubview(self.titleLabel)
        self.titleInnerStackView.addArrangedSubview(self.priceLabel)
        
        self.titleStackView.addArrangedSubview(self.titleInnerStackView)
        
        self.addSubview(self.titleStackView)
        self.addSubview(self.descriptionLabel)
        
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        
        self.titleStackView.snp.updateConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        self.descriptionLabel.snp.updateConstraints { make in
            make.top.equalTo(self.titleStackView.snp.bottom).offset(8)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(36)
        }
        
        super.updateConstraints()
    }
    
    public func configure() {
        guard let model = model else { return }
        
        self.titleLabel.text = model.type.title
        self.priceLabel.text = model.cost
        self.descriptionLabel.text = model.type.description
        self.imageView.image = model.type.icon
        
        switch model.type {
        case .staticIP:
            
            self.addSubview(self.deleteBtn)
            
            self.deleteBtn.snp.updateConstraints { make in
                make.top.equalTo(self.descriptionLabel.snp.bottom).offset(16)
                make.leading.equalToSuperview().offset(36)
                make.height.equalTo(48)
                make.bottom.equalToSuperview()
            }
            
        case .additionalTVBox:
            self.addSubview(self.customStepper)
            
            self.customStepper.snp.updateConstraints { make in
                make.top.equalTo(self.descriptionLabel.snp.bottom).offset(16)
                make.leading.equalToSuperview().offset(36)
                make.bottom.equalToSuperview()
                make.height.equalTo(48)
                make.width.equalTo(112)
            }
        }
    }
}
