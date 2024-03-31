//
//  TariffInfoCardView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit

class TariffInfoCardView: UIView {
    
    var model: TariffModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var topView: TariffCellTopView = {
        let view = TariffCellTopView()
        return view
    }()
    
    private lazy var tariffImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var tariffInfoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
    }
    
    private func addSubviews() {
        self.addSubview(self.topView)
        self.addSubview(self.tariffImageView)
        self.addSubview(self.tariffInfoStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.topView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.horizontalEdges.equalToSuperview().inset(2)
        }
        
        self.tariffImageView.snp.updateConstraints { make in
            make.width.height.equalTo(88)
            make.top.equalToSuperview().offset(52)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        self.tariffInfoStackView.snp.updateConstraints { make in
            make.top.equalTo(self.topView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func configure() {
        guard let model = model else { return }
        
        self.topView.backgroundColor = model.type.color
        self.topView.title = model.name
        
        self.tariffImageView.image = model.image
        
        for info in model.tariffInfos {
            let view = TariffContentSingleTile()
            view.data = info
            self.tariffInfoStackView.addArrangedSubview(view)
        }
        
    }
    
}
