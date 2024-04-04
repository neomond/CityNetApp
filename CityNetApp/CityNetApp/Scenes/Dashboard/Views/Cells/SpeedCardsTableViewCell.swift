//
//  SpeedCardsTableViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 03.04.24.
//

import UIKit
import CityNetUIkit

class SpeedCardsTableViewCell: UITableViewCell, ThemeableView {
    static let identifier = "SpeedCardsTableViewCell"
    
    var theme: ThemeProvider = App.theme
    
    lazy var speedCardView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.paleCarmine)
        view.layer.cornerRadius = 16
        view.layer.borderColor = adaptiveColor(.whitePrimary).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Yüksək sürətli internet tarifləri"
        label.font = AppFonts.SFBoldTitle3.fontStyle
        label.textColor = adaptiveColor(.black)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy"
        label.font = AppFonts.SFBoldCaption1.fontStyle
        label.textColor = adaptiveColor(.charcoalGray)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var speedImageView40: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.speedImage40.load()
        return imageView
    }()
    
    private lazy var speedImageView50: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.speedImage50.load()
        imageView.layer.zPosition = 1
        return imageView
    }()
    
    
    private lazy var speedImageView100: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppAssets.speedImage100.load()
        return imageView
    }()
    
    
    private lazy var actionButton: TariffReusableButton = {
        let button = TariffReusableButton(title: "Tariflərə bax",
                                          backgroundColor: self.adaptiveColor(.main),
                                          titleColor: self.adaptiveColor(.whitePrimary),
                                          font: AppFonts.SFBoldCallout.fontStyle)
        return button
    }()
    
    // MARK: init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell(with: .white)
        self.addSubviews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(speedCardView)
        
        self.speedCardView.addSubview(speedImageView40)
        self.speedCardView.addSubview(speedImageView50)
        self.speedCardView.addSubview(speedImageView100)
        self.speedCardView.addSubview(titleLabel)
        self.speedCardView.addSubview(subtitleLabel)
        
        self.speedCardView.addSubview(actionButton)
        
        
        self.updateConstraints()
    }
    
    private func setupUI() { }
    
    
    override func updateConstraints() {
        self.speedCardView.snp.updateConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(268)
            make.width.equalTo(263)
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.top.equalTo(speedImageView50.snp.bottom).offset(16)
            make.centerX.equalTo(speedCardView)
        }
        
        self.subtitleLabel.snp.updateConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalTo(speedCardView)
        }
        
        self.speedImageView50.snp.updateConstraints { make in
            make.centerX.equalTo(speedCardView)
            make.top.equalTo(speedCardView).offset(12)
            make.width.height.equalTo(102)
        }
        
        self.speedImageView40.snp.updateConstraints { make in
            make.centerY.equalTo(speedImageView50)
            make.right.equalTo(speedImageView50.snp.left).inset(28)
            make.width.height.equalTo(88)
        }
        
        self.speedImageView100.snp.updateConstraints { make in
            make.centerY.equalTo(speedImageView50)
            make.left.equalTo(speedImageView50.snp.right).inset(28)
            make.width.height.equalTo(88)
        }
        
        self.actionButton.snp.updateConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(48)
        }
        
        super.updateConstraints()
    }
    
    
    
}
