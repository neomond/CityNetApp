//
//  CustomStepper.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 29.03.24.
//

import UIKit

class CustomStepper: UIView {
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(decrementValue), for: .touchUpInside)
        return button
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.darkGray, for: .normal) 
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(incrementValue), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [minusButton, valueLabel, plusButton])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 20
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.clipsToBounds = true
        return stack
    }()
    
    private func updateMinusButtonState() {
        let currentValue = Int(valueLabel.text ?? "0") ?? 0
        let color: UIColor = currentValue > 0 ? .darkGray : .lightGray
        minusButton.setTitleColor(color, for: .normal)
        minusButton.isEnabled = currentValue > 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        updateMinusButtonState()
    }
    
    @objc private func decrementValue() {
        if let currentValue = Int(valueLabel.text ?? "0"), currentValue > 0 {
            valueLabel.text = "\(currentValue - 1)"
        }
        updateMinusButtonState()
    }
    
    @objc private func incrementValue() {
        if let currentValue = Int(valueLabel.text ?? "0") {
            valueLabel.text = "\(currentValue + 1)"
        }
        updateMinusButtonState()
    }
    
    func setValue(_ value: Int) {
        valueLabel.text = "\(value)"
        updateMinusButtonState()
    }
}
