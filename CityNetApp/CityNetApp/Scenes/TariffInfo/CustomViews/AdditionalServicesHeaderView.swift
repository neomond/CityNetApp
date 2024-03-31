//
//  AdditionalServicesHeaderView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 29.03.24.
//

import UIKit
import CityNetUIkit

class AdditionalServicesHeaderView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Əlavə xidmətlərimiz"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .gray
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, infoButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(stackView)
        self.stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func infoButtonTapped() {
        
    }
}
