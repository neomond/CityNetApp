//
//  AppStepper.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

class AppStepper: UIControl, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    struct ViewData {
        let minimum: Double
        let maximum: Double
        let stepValue: Double
    }
    
    private lazy var plusButton = createStepperButton(image: AppAssets.plusIcon.load(), value: 1)
    private lazy var minusButton = createStepperButton(image: AppAssets.minusIcon.load(), value: -1)
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    private lazy var container: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        return stack
    }()
    
    private(set) var value: Double = 0
    private let viewData: ViewData
    
//   MARK: init
    
    init(viewData: ViewData) {
        self.viewData = viewData
        super.init(frame: .zero)
        
        setup()
        setValue(value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(_ newValue: Double, animated: Bool = false) {
        let clampedValue = max(min(newValue, viewData.maximum), viewData.minimum)
        updateValue(clampedValue, animated: animated)
    }
    
    private func setup() {
        addSubview(container)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        container.layer.cornerRadius = 12
        container.layer.borderWidth = 1
        container.layer.borderColor = adaptiveColor(.graySecondary).cgColor
        
        [minusButton, counterLabel, plusButton].forEach(container.addArrangedSubview)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
    }
    
    private func updateValue(_ newValue: Double, animated: Bool) {
        value = newValue
        counterLabel.text = "\(newValue)"
        adjustButtonColors()
        
        sendActions(for: .valueChanged)
    }
    
    private func adjustButtonColors() {
        minusButton.tintColor = value > viewData.minimum ? adaptiveColor(.grayPrimary) : adaptiveColor(.graySecondary)
        plusButton.tintColor = value < viewData.maximum ? adaptiveColor(.grayPrimary) : adaptiveColor(.graySecondary)
    }
    
    private func createStepperButton(image: UIImage?, value: Int) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tag = value
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tintColor = adaptiveColor(.grayPrimary)
        return button
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let delta = Double(sender.tag) * viewData.stepValue
        setValue(value + delta, animated: true)
    }
}

